class VersionsController < ApplicationController
  respond_to :js
  def index
    # TODO require authorization.
    render(
      json: {
        current_version: current_version_number,
        latest_version: latest_version_number,
        update_instructions_link: root_url
      },
      status: :ok
    )
  end

private

  def latest_version_number
    remote_url = URI('https://raw.githubusercontent.com/jweakley/doorbot-server/master/VERSION')
    Net::HTTP.get(remote_url).gsub(/[^0-9a-z.]/i, '')
  end

  def current_version_number
    File.open("#{Rails.root}/VERSION",  &:readline).gsub(/[^0-9a-z.]/i, '')
  end

end
