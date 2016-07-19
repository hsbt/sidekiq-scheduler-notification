require 'test_helper'

class Sidekiq::Scheduler::NotificationTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Sidekiq::Scheduler::Notification::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
