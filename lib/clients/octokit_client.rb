# frozen_string_literal: true

class OctokitClient
  GITHUB_TOKEN = ENV['GITHUB_TOKEN'].freeze

  def initialize
    @client = setup_client
  end

  def create_gist(params)
    @client.create_gist(params)
  end

  def success?
    @client.last_response.status&.to_s&.match?(/2\d\d/)
  end

  private

  def setup_client
    Octokit::Client.new(access_token: GITHUB_TOKEN)
  end
end
