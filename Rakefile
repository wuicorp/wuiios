# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'rubygems'
require 'bundler'
Bundler.require

require 'yaml'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'wuiios'

  app.development do
    env = YAML.load_file('config/development.yml')
    env.each { |k, v| app.env[k] = v }
  end
end
