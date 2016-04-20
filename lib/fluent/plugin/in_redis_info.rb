class Fluent::Redis_InfoInput < Fluent::Input
  Fluent::Plugin.register_input('redis_info', self)

  config_param :tag,      :string
  config_param :host,     :string,  :default => nil
  config_param :port,     :integer, :default => 6379
  config_param :interval, :integer, :default => 10
  config_param :command,  :string,  :default => nil


  def initialize
    super
    require 'redis'
  end

  def adjust_type(value)
    if value =~ /^\-*\d+\.\d+$/
      return value.to_f
    elsif value =~ /^\-*\d+$/
      return value.to_i
    end
    value
  end

  def configure(conf)
    super
    @get_interval = @interval
  end

  def start
    super
    @redis = Redis.new(
      :host => @host, 
      :port => @port,
      :thread_safe => true
    )
    pong = @redis.ping
    begin
        unless pong == 'PONG'
            raise "fluent-plugin-redis-info: cannot connect redis"
        end
    end
    @watcher = Thread.new(&method(:watch))
  end

  def shutdown
    super
    @redis.quit
  end

  private
  def watch
    while true
      sleep @get_interval
      output
    end
  end

  def output 
    info = @redis.info(@command)

    output_info = {}
    info.each do |key, value|
      if key =~/^cmdstat_/ || key =~ /^db\d+/
        output_value = {}
        Hash[value.split(",").map { |e| e.split("=") }].each do |k,v|
          output_value[k] = adjust_type(v)
        end
        output_info[key] = output_value
      else
        output_info[key] = adjust_type(value)
      end
    end

    Fluent::Engine.emit(tag, Time.now.to_i, output_info)
  end
end

