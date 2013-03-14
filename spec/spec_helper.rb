# encoding: utf-8

require 'devtools'
require 'js'
Devtools.init_spec_helper

RSpec.configure do |config|
  config.extend(JSHelper)
end
