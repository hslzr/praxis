require 'paint'

class Item
  attr_reader :index, :name
  attr_accessor :weight, :uses

  def initialize(index, name, opts = {})
    @index, @name = index, name
    @weight = opts[:weight]
    @uses   = opts[:uses]
  end

  def usable?
    return false if @uses.nil?
    return false if @uses == 0
    
    true
  end

  def use
    return unless usable?
    return if @uses == 0
    
    warn_for_uses
    @uses -= 1
  end

  
  private

  def warn_for_uses
    return unless usable?
    
    case (@uses - 1)
    when 1..3
      puts Paint["Your #{@name} is about to break.", :yellow]
      return :warning
    when 0
      puts Paint["Your #{@name} broke.", :red]
      return :fatal
    else
      return nil
    end
  end
end
