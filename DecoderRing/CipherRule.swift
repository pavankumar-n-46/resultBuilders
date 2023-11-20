import Foundation

protocol CipherRule {
  func encipher(_ value: String) -> String
  func decipher(_ value: String) -> String
}

extension Array: CipherRule where Element == CipherRule {
  func encipher(_ value: String) -> String {
    reduce(value) { partialResult, secret in
      secret.encipher(partialResult)
    }
  }
  
  func decipher(_ value: String) -> String {
    reduce(value) { partialResult, secret in
      secret.decipher(partialResult)
    }
  }

}
