# NOTE: only doing this in development as some production environments (Heroku)
# NOTE: are sensitive to local FS writes, and besides -- it's just not proper
# NOTE: to have a dev-mode tool do its thing in production.
if Rails.env.development?

def valid? version
  pattern = /^\d+\.\d+\.\d+(\-(dev|beta|rc\d+))?$/
  raise "Tried to set invalid version: #{version}" unless version =~ pattern
end

def correct_version version
  ver, flag = version.split '-'
  v = ver.split '.'
  (0..2).each do |n|
    v[n] = v[n].to_i
  end
  [v.join('.'), flag].compact.join '-'
end

def read_version
  unless File.exists?('VERSION')
    File.new('VERSION', 'w').close()
    write_version('1.0.0')
  end
  File.read('VERSION')
rescue => e
  raise "VERSION file not found or unreadable."
end

def write_version(version)
  valid? version
  begin
    File.open('VERSION', 'w') do |file|
      file.puts correct_version(version)
    end
    tag_git_version(version)
    commit_hashes = fetch_git_commit_hashes(version)
    stub_changelog(version, commit_hashes)
  rescue
    raise "VERSION file not found or unwritable."
  end
end

def open_git_for_version(version)
  Git.open(
    Dir.pwd,
    log: Logger.new(File.open('./log/git_version_task.log', 'w+'), 5)
  )
rescue
  raise "Failed when using Git. See git_version_task.log for more info."
end

def tag_git_version(version)
  open_git_for_version(version).add_tag("v#{version}")
end

def fetch_git_commit_hashes(version)
  g = open_git_for_version(version)
  tag_names = g.tags.last(2).map(&:name)
  logs = (tag_names.count == 2 ? g.log.between(*tag_names) : g.log)
  logs.map do |commit|
    {
      author: commit.author.try(:name),
      message: commit.message
    }
  end
end

def stub_changelog(version, commit_hashes)
  if File.exists?('CHANGELOG.md')
    prepend_changelog(version, commit_hashes)
  else
    File.open('CHANGELOG.md', 'w') do |file|
      write_version_to_header_stub(file, version, commit_hashes)
    end
  end
rescue
  raise "CHANGELOG.md file not found or unwritable."
end

def prepend_changelog(version, commit_hashes)
  File.open('CHANGELOG.md.tmp', 'w') do |new_file|
    write_version_to_header_stub(new_file, version, commit_hashes)
    File.open('CHANGELOG.md', 'r+') do |old_file|
      old_file.each_line { |line| new_file.puts line }
    end
  end
  File.delete('CHANGELOG.md')
  File.rename('CHANGELOG.md.tmp', 'CHANGELOG.md')
end

def write_version_to_header_stub(file, version, commit_hashes)
  file.puts "\#\# #{version} (#{Date.today.to_s})"
  file.puts ''
  commit_hashes.each do |hash|
    file.puts "* #{hash[:message]}"
  end
  file.puts ''
end

def reset(current, which)
  version, flag = current.split '-'
  v = version.split '.'
  which.each do |part|
    v[part] = 0
  end
  [v.join('.'), flag].compact.join '-'
end

def increment(current, which)
  version, flag = current.split '-'
  v = version.split '.'
  v[which] = v[which].to_i + 1
  [v.join('.'), flag].compact.join '-'
end

desc "Prints the current application version"
version = read_version
task :version do
  puts <<HELP
Available commands are:
-----------------------
rake version:patch            # increment the patch x.x.x+1 (keeps any flags on)
rake version:minor            # increment minor and reset patch x.x+1.0 (keeps any flags on)
rake version:major            # increment major and reset others x+1.0.0 (keeps any flags on)
rake version:dev              # set the dev flag on x.x.x-dev
rake version:beta             # set the beta flag on x.x.x-beta
rake version:rc               # set or increment the rc flag x.x.x-rcX
rake version:release          # removes any flags from the current version

HELP
  puts "Current version is: #{version}"
end

namespace :version do
  desc "Increments the patch version"
  task :patch do
    new_version = increment read_version, 2
    write_version new_version
    puts "Application patched: #{new_version}"
  end

  desc "Increments the minor version and resets the patch"
  task :minor do
    incremented = increment read_version, 1
    new_version = reset incremented, [2]
    write_version new_version
    puts "New version released: #{new_version}"
  end

  desc "Increments the major version and resets both minor and patch"
  task :major do
    incremented = increment read_version, 0
    new_version = reset incremented, [1, 2]
    write_version new_version
    puts "Major application version change: #{new_version}. Congratulations!"
  end

  desc "Sets the development flag on"
  task :dev do
    version, flag = read_version.split '-'
    new_version = [version, 'dev'].join '-'
    write_version new_version
    puts "Version in development: #{new_version}"
  end

  desc "Sets the beta flag on"
  task :beta do
    version, flag = read_version.split '-'
    new_version = [version, 'beta'].join '-'
    write_version new_version
    puts "Version in beta: #{new_version}"
  end

  desc "Sets or increments the rc flag"
  task :rc do
    version, flag = read_version.split '-'
    rc = /^rc(\d+)$/.match flag
    if rc
      new_version = [version, "rc#{rc[1].to_i+1}"].join '-'
    else
      new_version = [version, 'rc1'].join '-'
    end
    write_version new_version
    puts "New version release candidate: #{new_version}"
  end

  desc "Removes any version flags"
  task :release do
    version, flag = read_version.split '-'
    write_version version
    puts "Released stable version: #{version}"
  end
end

end
