class Bard
  attr_reader :phrases
  def initialize(memory=Memory.new)
    @phrases = memory.recall
  end

  def to_s
    (1..phrases.size).map do |number| 
      'This is ' + phrases.last(number).join(' ') + ".\n\n"
    end.join
  end
end

class Memory
  attr_reader :actors, :actions
  def initialize(actors=ACTORS, actions=ACTIONS)
    @actors, @actions = determine_order(actors, actions)
  end

  def determine_order(actors, actions)
    [actors, actions]
  end

  def recall
    actors.zip(actions).map do |actor, action|
      'the ' + actor + ' that ' + action
    end << 'the house that Jack built'
  end

  ACTORS = ['horse and the hound and the horn','farmer sowing his corn','rooster that crowed in the morn','priest all shaven and shorn','man all tattered and torn','maiden all forlorn','cow with the crumpled horn','dog','cat','rat','malt']
  ACTIONS = ['belonged to','kept','woke','married','kissed','milked','tossed','worried','killed','ate','lay in']
end

class ImpairedMemory < Memory
  def determine_order(actors, actions)
    [actors.shuffle, actions.shuffle]
  end
end
