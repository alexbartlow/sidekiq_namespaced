require 'sidekiq'
require 'redis'
require 'redis/namespace'
module SidekiqNamespaced
  def with_namespace namespace, &block
    begin
      Thread.current[:sidekiq_namespace_override] = namespace
      block.call
    ensure
      Thread.current[:sidekiq_namespace_override] = nil
    end
  end

  def redis_with_namespace &block
    redis_without_namespace do |conn|
      raw_client = conn.is_a?(Redis::Namespace) ? conn.redis : conn
      if Thread.current[:sidekiq_namespace_override]
        conn_with_namespace = Redis::Namespace.new(Thread.current[:sidekiq_namespace_override], redis: raw_client)
        block.call(conn_with_namespace)
      else
        block.call(conn)
      end
    end
  end

  def self.decorate(base)
    base.send(:extend, self)
    singleton_class = class << base
                        self
                      end
    singleton_class.send(:alias_method, :redis_without_namespace, :redis)
    singleton_class.send(:alias_method, :redis, :redis_with_namespace)
  end
end

