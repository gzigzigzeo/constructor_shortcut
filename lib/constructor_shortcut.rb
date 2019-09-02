require "constructor_shortcut/version"
require "constructor_shortcut/cache"

# Generates anonymous module containing single class method
module ConstructorShortcut
  # Used to set method name
  def self.[](name = :call, class_name = :call)
    Cache.resolve(name, class_name)
  end

  def call(*args, &block)
    new(*args, &block).call
  end
end
