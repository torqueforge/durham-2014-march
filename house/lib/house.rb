require 'delegate'

class Bard
  attr_reader :memory
  def initialize(memory)
    @memory = memory
  end

  def to_s
    memory.length.times.map{|number| verse(number+1)}.join
  end

  def verse(number)
    'This is ' + memory.last(number).join(' ') + ".\n\n"
  end
end

class Memory < SimpleDelegator
end

class DrunkenMemory < Memory
  def last(*args)
    story.last(*args)
  end

  def story
    @story ||= __getobj__.shuffle
  end
end
