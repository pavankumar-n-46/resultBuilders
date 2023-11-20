

import SwiftUI

struct TextOutputView: View {
  @Binding var output: String
  @Binding var secretMode: SecretMode
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        FormLabelView(isSecret: secretMode == .decode)
        if secretMode == .encode {
          Spacer()
          ShareLink(item: output) {
            Image(systemName: "square.and.arrow.up")
          }
        }
      }
      .padding(8)
      ZStack(alignment: .topLeading) {
        RoundedRectangle(cornerRadius: 16)
          .fill(Color.white)
          .padding(8)
        ScrollView {
          Text(output)
            .font(.body)
            .monospaced()
        }
        .padding()
      }.background {
        StripedBackground(
          primary: secretMode == .decode ? .red : .yellow,
          secondary: .black.opacity(0.7)
        )
        .cornerRadius(24)
      }
      .frame(maxHeight: 200)
    }
  }
}

struct TextOutputView_Previews: PreviewProvider {
  static let output = """
MESSAGEOUTPUTHERE
"""
  static var previews: some View {
    TextOutputView(output: .constant(output), secretMode: .constant(.encode))
  }
}
