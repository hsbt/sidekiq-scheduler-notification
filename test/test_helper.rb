$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sidekiq/scheduler/notification'

require 'yaml'
require 'minitest/autorun'
