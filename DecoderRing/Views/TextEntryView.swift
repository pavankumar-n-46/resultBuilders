

import SwiftUI
import UniformTypeIdentifiers

struct TextEntryView: View {
  @Binding var message: String
  @Binding var secretMode: SecretMode
  var body: some View {
    VStack(alignment: .leading) {
      FormLabelView(isSecret: secretMode == .encode)
      TextEditor(text: $message)
        .font(.body)
        .monospaced()

        .cornerRadius(16)
        .frame(maxHeight: 200)
        .padding(8)
        .background {
          StripedBackground(
            primary: secretMode == .encode ? .red : .yellow,
            secondary: .black.opacity(0.7)
          )
          .cornerRadius(24)
        }
    }
  }
}

struct TextEntryView_Previews: PreviewProvider {
  static var previews: some View {
    TextEntryView(message: .constant("A Secret Report within the Guild"), secretMode: .constant(.encode))
  }
}
