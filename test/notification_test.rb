require 'test_helper'

class Sidekiq::Scheduler::NotificationTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Sidekiq::Scheduler::Notification::VERSION
  end

  def test_notify_classes
    Sidekiq.schedule = YAML.load_file(File.expand_path('../fixtures.yml', __FILE__))

    Sidekiq::Scheduler.load_schedule!

    assert_equal ["NotificationJob"], Sidekiq::Scheduler.notify_classes
  end
end
