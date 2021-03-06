module Pushr
  module Daemon
    class Gcm
      attr_accessor :configuration, :handlers

      def initialize(options)
        @configuration = options
        @handlers = []
      end

      def start
        configuration.connections.times do |i|
          connection = GcmSupport::ConnectionGcm.new(configuration, i + 1)
          connection.connect

          handler = MessageHandler.new("pushr:#{configuration.app}:#{configuration.name}", connection, configuration.app, i + 1)
          handler.start
          @handlers << handler
        end
      end

      def stop
        @handlers.map(&:stop)
      end
    end
  end
end
