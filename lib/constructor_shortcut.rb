require "constructor_shortcut/version"

# Generates anonymous module containing single class method
module ConstructorShortcut
  # Used to set method name
  def self.[](name = :call)
    @cache ||= {}
    @cache[name] ||=
      Module.new do
        define_method name do |*args, **kwargs, &block|
          new(*args, **kwargs, &block).public_send(name)
        end
      end
  end
end
