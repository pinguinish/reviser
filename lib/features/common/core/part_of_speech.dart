enum PartOfSpeech {
  noun(definition: "words that name people, places, things, or ideas"),
  adjective(definition: "words that modify or describe nouns or pronouns"),
  adverb(
    definition:
        "words that modify or describe verbs, adjectives, or other adverbs",
  ),
  verb(definition: "words that show actions or states of being"),
  pronoun(
    definition: "words that take the place of nouns",
    isClose: true,
  ),
  conjunction(
    definition: "words that join words, phrases, or clauses",
    isClose: true,
  ),
  interjection(
    definition: "words that express emotions or feelings",
    isClose: true,
  ),
  determiner(
    definition: "words that specify or limit the meaning of nouns",
    isClose: true,
  ),
  preposition(
    definition:
        "words that show the relationship between a noun or pronoun and another word in the sentence",
    isClose: true,
  );

  const PartOfSpeech({
    required this.definition,
    this.isClose = false,
  });

  final String definition;
  final bool isClose;

  static List<PartOfSpeech> get all => [
        noun,
        adjective,
        pronoun,
        verb,
        conjunction,
        interjection,
        interjection,
        determiner,
        adverb,
        preposition,
      ];
}
