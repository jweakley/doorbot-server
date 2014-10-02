module DoorbotServer
  class Application
    VERSION = File.open("#{Rails.root}/VERSION",  &:readline).gsub(/[^0-9a-z.]/i, '')
  end
end
