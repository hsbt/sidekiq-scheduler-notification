require 'active_support/core_ext/module'
require 'sidekiq-scheduler'
require 'sidekiq/middleware/server/slack_notification'
require 'sidekiq/scheduler/notification/version'

module Sidekiq
  class Scheduler
    cattr_accessor :notify_classes do
      if Sidekiq.schedule
        Sidekiq.schedule.select{|_,v| v["notification"] }.map{|k,_| k}
      end
    end

    cattr_accessor :notify_webhook
  end
end
