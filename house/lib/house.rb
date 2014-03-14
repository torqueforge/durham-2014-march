require 'delegate'

class Bard
  attr_reader :phrase
  def initialize(memory)
    @phrase = PhraseConstructor.new(memory)
  end

  def to_s
    phrase.length.times.map{|number| verse(number+1)}.join
  end

  def verse(number)
    'This is ' + phrase.last(number).join(' ') + ".\n\n"
  end
end

class PhraseConstructor
  attr_reader :words
  def initialize(memory)
    @words = memory.recall
  end

  def last(*args)
    words.map do |actor, action|
      'the ' + actor + ' that ' + action
    end.last(*args)
  end
  
  def length
    words.length
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
