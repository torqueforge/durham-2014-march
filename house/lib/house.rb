class HouseSong
  def sing
    verses.map{|v| v + "\n\n"}
  end

  def verses
    (0..11).map{|number| verse(number)}
  end

  def verse(number)
    'This is' + verse_subjects[0..number].inject('') { |result, subject| ' ' + subject + result } + '.'
  end

  def verse_subjects
    [
      'the house that Jack built',
      'the malt that lay in',
      'the rat that ate',
      'the cat that killed',
      'the dog that worried',
      'the cow with the crumpled horn that tossed',
      'the maiden all forlorn that milked',
      'the man all tattered and torn that kissed',
      'the priest all shaven and shorn that married',
      'the rooster that crowed in the morn that woke',
      'the farmer sowing his corn that kept',
      'the horse and the hound and the horn that belonged to'
    ]
  end
end
