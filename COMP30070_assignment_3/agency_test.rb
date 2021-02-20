require 'test/unit'
require_relative 'agency.rb'
require_relative 'player.rb'

class AgencyTest < Test::Unit::TestCase
  def setup
    @mdt = Agency.new
  end
end