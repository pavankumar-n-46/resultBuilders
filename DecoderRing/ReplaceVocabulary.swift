import Foundation

struct ReplaceVocabulary: CipherRule {
  let terms: [(original: String, replacement: String)]

  func encipher(_ value: String) -> String {
    terms.reduce(value) { encripheredMessage, term in
      encripheredMessage.replacingOccurrences(
        of: term.original,
        with: term.replacement,
        options: .caseInsensitive)
    }
  }

  func decipher(_ value: String) -> String {
    terms.reduce(value) { decipheredMessage, term in
      decipheredMessage.replacingOccurrences(
        of: term.replacement,
        with: term.original,
        options: .caseInsensitive)
    }
  }
}
