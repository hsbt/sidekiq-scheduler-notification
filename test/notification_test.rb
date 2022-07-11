require 'test_helper'

class Sidekiq::Scheduler::NotificationTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SidekiqScheduler::Scheduler::Notification::VERSION
  end

  def test_notify_classes
    Sidekiq.schedule = ::YAML.load_file(File.expand_path('../fixtures.yml', __FILE__))

    SidekiqScheduler::Scheduler.load_schedule!

    assert_equal ["NotificationJob"], SidekiqScheduler::Scheduler.notify_classes
  end
end
