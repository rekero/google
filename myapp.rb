require_relative 'workers/google_worker'
require_relative 'config/initializers/sidekiq'
class Application < Sinatra::Base
  get '/healthcheck' do
    'Ok'
  end

  get '/google' do
    GoogleWorker.perform_async
  end
end