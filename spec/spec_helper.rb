require 'rspec'
require 'pry'
require './lib/item'
require './lib/attendee'
require './lib/auction'
RSpec.configure do |config| 
    config.formatter = :documentation 
end
