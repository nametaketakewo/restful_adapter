# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'
require 'bundler/setup'

require 'rails'
require 'active_model_serializers'
require 'restful_adapter'

require 'minitest'
require 'minitest/autorun'
