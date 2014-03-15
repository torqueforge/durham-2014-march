class Bard
  attr_reader :phrases
  def initialize(memory)
    @phrases = memory.recall
  end

  def to_s
    phrases.length.times.map{|number| verse(number+1)}.join
  end

  def verse(number)
    'This is ' + phrases.last(number).join(' ') + ".\n\n"
  end
end

class Memory
  attr_reader :actors, :actions
  def initialize(actors=ACTORS, actions=ACTIONS)
    @actors, @actions = pre_initialize(actors, actions)
  end

  def pre_initialize(actors, actions)
    [actors, actions]
  end

  def recall
    actors.zip(actions).map { |actor, action|
      'the ' + actor + ' that ' + action
    } << 'the house that Jack built'
  end

  ACTORS = ['horse and the hound and the horn','farmer sowing his corn','rooster that crowed in the morn','priest all shaven and shorn','man all tattered and torn','maiden all forlorn','cow with the crumpled horn','dog','cat','rat','malt']
  ACTIONS = ['belonged to','kept','woke','married','kissed','milked','tossed','worried','killed','ate','lay in']
end

class ImpairedMemory < Memory
  def pre_initialize(actors, actions)
    [actors.shuffle, actions.shuffle]
  end
end
