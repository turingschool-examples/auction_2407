require './lib/item'
require './lib/attendee'

Spec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Attendee do 
  before(:each) do 
    @attendee = Attendee.new({name: 'Megan'})
  end

  it 'exists' do 
    exepct(@ttendee).to be_an_instance_of(Attendee)
  end
end
  