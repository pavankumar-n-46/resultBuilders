import Foundation


struct SuperSecretCipher {
  let useVocabularyReplacement: Bool
  let offset: Int
  let cycles: Int

  @CipherBuilder
  var cipherRule: CipherRule {
    if useVocabularyReplacement {
      ReplaceVocabulary(terms: [
          ("SECRET", "CHOCOLATE"),
          ("MESSAGE", "MESS"),
          ("PROTOCOL", "LEMON GELATO"),
          ("DOOMSDAY", "BLUEBERRY PIE")
        ])
    }
    for _ in 1...cycles {
      LetterSubstitution(offset: offset)
    }
  }
}
