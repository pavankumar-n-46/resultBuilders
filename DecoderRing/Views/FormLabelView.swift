

import SwiftUI

struct FormLabelView: View {
  var isSecret: Bool
  var body: some View {
    Label {
      Text(isSecret ? "Plaintext:" : "Ciphertext:")
    } icon: {
      Image(systemName: isSecret ? "text.bubble" : "captions.bubble")
    }
  }
}

struct FormLabelView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      FormLabelView(isSecret: true)
      FormLabelView(isSecret: false)
    }
  }
}
