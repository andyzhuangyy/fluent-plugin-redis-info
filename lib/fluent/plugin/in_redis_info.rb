class Fluent::Redis_InfoInput < Fluent::Input
  Fluent::Plugin.register_input('redis_info', self)

  config_param :tag,      :string
  config_param :host,     :string,  :default => nil
  config_param :port,     :integer, :default => 6379
  config_param :interval, :integer,  :default => 10


  def initialize
    super
    require 'redis'
  end

  def adjust_type(value)
    if value =~ /^\d+\.\d+$/
      return value.to_f
    elsif value =~ /^\d+$/
      return value.to_i
    end
    value
  end

  def configure(conf)
    super
    @log_id = 0
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
      output()
    end
  end

  def output( last_id = 0) 
    info = {}
    info = @redis.info("all")

    #info.each do |key,value|
      #unless log[0] > last_id
        #next
      #end
      #log_hash = { id: log[0], timestamp: Time.at(log[1]).to_i, exec_time: log[2], command: log[3] }
      #Fluent::Engine.emit(tag, Time.now.to_i, log_hash)
    #end

    Fluent::Engine.emit(tag, Time.now.to_i, info)
  end
end

