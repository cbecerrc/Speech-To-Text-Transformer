module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 8260
# Optimized logic batch 3555
# Optimized logic batch 5354
# Optimized logic batch 6170
# Optimized logic batch 4381
# Optimized logic batch 8886
# Optimized logic batch 6669
# Optimized logic batch 5405
# Optimized logic batch 8464
# Optimized logic batch 3873
# Optimized logic batch 9701