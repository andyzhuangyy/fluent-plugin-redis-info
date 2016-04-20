require 'helper'

class Redis_InfoInputTest < Test::Unit::TestCase

  def setup
    Fluent::Test.setup
  end

  CONFIG = %[
      tag redis-info
      host localhost
      port 6379
      interval 10
      command all
  ]

  def create_driver(conf = CONFIG)
    Fluent::Test::InputTestDriver.new(Fluent::Redis_InfoInput).configure(conf)
  end

  def test_output(conf = CONFIG)
    obj = create_driver.instance
    #obj.start
    #obj.output_public
    #obj.stop
  end

end
