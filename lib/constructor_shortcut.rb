require "constructor_shortcut/version"

# Generates
module ConstructorShortcut
  def self.[](name)
    @cache ||= {}
    @cache[name] ||=
      Module.new do
        define_method name do |*args, **kwargs, &block|
          new(*args, **kwargs, &block).public_send(name)
        end
      end
  end
end
