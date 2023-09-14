require_relative '../config/initializers/sidekiq'
require 'faraday'
require 'faraday_middleware'

class GoogleWorker
  include Sidekiq::Job

  def perform()
    conn = Faraday.new() do |f|
      f.use FaradayMiddleware::FollowRedirects, limit: 5
      f.adapter Faraday.default_adapter
    end
    resp = conn.get('https://google.com')
    File.open("google.txt", 'w') {|f| f.write(resp.body) }
  end
end