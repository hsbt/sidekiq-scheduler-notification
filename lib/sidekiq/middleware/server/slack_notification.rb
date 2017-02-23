require 'slack-notifier'

module Sidekiq
  module Middleware
    module Server
      class SlackNotification
        def call(_worker, job, _queue)
          if Sidekiq::Scheduler.notify_classes.include? job['wrapped']
            notifier ||= Slack::Notifier.new(Sidekiq::Scheduler.notify_webhook) do
              defaults username: 'Sidekiq Notification'
            end
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
