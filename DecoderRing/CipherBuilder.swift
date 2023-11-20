import Foundation

@resultBuilder
enum CipherBuilder {
  static func buildBlock(_ components: CipherRule...) -> CipherRule {
    components
  }

  static func buildArray(_ components: [CipherRule]) -> CipherRule {
    components
  }

  static func buildOptional(_ component: CipherRule?) -> CipherRule {
    component ?? []
  }
}
