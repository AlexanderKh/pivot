require 'spec_helper'
# Implement a simple logger for the pivot app

RSpec.describe Pivot::Logger do

  let(:logger) { Pivot::Logger.new($stdout) }

  it "is subclassed from the stdlib Logger class" do
    expect(logger.class.superclass).to eq(Logger)
  end

end