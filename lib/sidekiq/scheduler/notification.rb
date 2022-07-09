require 'sidekiq-scheduler'
require 'sidekiq/middleware/server/slack_notification'
require 'sidekiq/scheduler/notification/version'

module SidekiqScheduler
  class Scheduler
    class << self
      attr_accessor :notify_classes, :notify_webhook
    end
  end
end

module SidekiqSchedulerNotification
  def load_schedule!
    super
    if Sidekiq.schedule
      SidekiqScheduler::Scheduler.notify_classes = Sidekiq.schedule.select{|_,v| v["notification"] }.map{|k,_| k}
    end
  end
end

SidekiqScheduler::Scheduler.prepend SidekiqSchedulerNotification

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Sidekiq::Middleware::Server::SlackNotification
  end
end
