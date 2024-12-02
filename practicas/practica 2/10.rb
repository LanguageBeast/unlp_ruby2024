module Countable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def count_invocations_of(sym)
      alias_method "#{sym}_original", sym

      define_method(sym) do |*args, &block|
        @invocations ||= Hash.new(0)
        @invocations[sym] += 1
        send("#{sym}_original", *args, &block)
      end
    end
  end

  def invoked?(sym)
    @invocations ||= Hash.new(0)
    @invocations[sym] > 0
  end

  def invoked(sym)
    @invocations ||= Hash.new(0)
    @invocations[sym]
  end
end