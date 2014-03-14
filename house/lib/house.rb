require 'delegate'

class Bard
  attr_reader :phrases
  def initialize(memory)
    @phrases = Phrases.new(memory)
  end

  def to_s
    phrases.length.times.map{|number| verse(number+1)}.join
  end

  def verse(number)
    'This is ' + phrases.last(number).join(' ') + ".\n\n"
  end
end

class Phrases
  attr_reader :phrase_bank
  def initialize(memory)
    @phrase_bank = memory.recall.map do |actor, action|
      'the ' + actor + ' that ' + action
    end
  end

  def last(*args)
    phrase_bank.last(*args)
  end
  
  def length
    phrase_bank.length
  end
end

class Memory < SimpleDelegator
  def recall
    __getobj__
  end
end

class DrunkenMemory < Memory
  def recall
    __getobj__[0..-2].transpose.map(&:shuffle).transpose << __getobj__.last
  end
end
