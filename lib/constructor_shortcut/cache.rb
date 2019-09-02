# rubocop:disable Metrics/MethodLength, Style/Documentation
module ConstructorShortcut
  module Cache
    def self.resolve(name, class_name)
      @cache ||= {}
      key = "#{name.inspect}, #{class_name.inspect}".freeze

      @cache[key] ||=
        Module.new do
          @key = key

          class << self
            def name
              "ConstructorShortcut[#{@key}]"
            end
            alias_method :to_s, :name
            alias_method :to_str, :name
            alias_method :inspect, :name
          end

          define_method class_name do |*args, &block|
            new(*args, &block).public_send(name)
          end
        end
    end
  end
end
