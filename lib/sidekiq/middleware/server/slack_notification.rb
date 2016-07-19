require 'slack-notifier'

module Sidekiq
  module Middleware
    module Server
      class SlackNotification
        def call(_worker, job, _queue)
          if job['wrapped'].in? ::Sidekiq::Scheduler.notify_classes
            notifier ||= Slack::Notifier.new(::Sidekiq::Scheduler.notify_webhook)
            notifier.username = 'Sidekiq Notification'
            begin
              notifier.ping "Start : #{job['wrapped']}"
              yield
            rescue => e
              notifier.ping "Error : #{job['wrapped']}: #{e.message}"
            ensure
              notifier.ping "Finish: #{job['wrapped']}"
            end
          else
            yield
          end
        end
      end
    end
  end
end
