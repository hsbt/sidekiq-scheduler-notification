$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sidekiq/scheduler/notification'

pp require 'yaml'
require 'minitest/autorun'
