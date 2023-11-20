import Foundation

struct LetterSubstitution: CipherRule {
  let letters: [String]
  let offset: Int

  init(offset: Int) {
    self.letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map(String.init)
    self.offset = max(1, min(offset, 25))
  }

  func swapLetters(_ value: String, offset: Int) -> String {
    let plainText = value.map(String.init)

    return plainText.reduce("") { message, letter in
      if let index = self.letters.firstIndex(of: letter.uppercased()) {
        let cipherOffset = (index + offset) % 26
        let cipherIndex = cipherOffset < 0 ? 26 + cipherOffset : cipherOffset
        let cipherLetter = letters[cipherIndex]
        return message + cipherLetter
      } else {
        return message + letter
      }
    }
  }

  func encipher(_ value: String) -> String {
    swapLetters(value, offset: offset)
  }

  func decipher(_ value: String) -> String {
    swapLetters(value, offset: -offset)
  }
}
