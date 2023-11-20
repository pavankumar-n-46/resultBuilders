import SwiftUI

struct ContentView: View {
  @State var message: String = ""
  @State var secret: String = ""
  @State var secretMode: SecretMode = .encode

  var body: some View {
    ZStack {
      Rectangle().fill(Color("Background")).ignoresSafeArea()
      VStack {
        SilhouetteView()
          .frame(height: 70)
        TextEntryView(message: $message, secretMode: $secretMode)
          .padding()
        Picker(selection: $secretMode, label: Text("Mode")) {
          ForEach(SecretMode.allCases) { mode in
            Text(mode.rawValue.capitalized).tag(mode)
          }
        }
        .pickerStyle(.segmented)
        .padding()
        TextOutputView(output: $secret, secretMode: $secretMode)
          .padding()
      }
      .onChange(of: message) { newValue in
        secret = processMessage(newValue)
      }
      .onChange(of: secretMode) { _ in
        secret = processMessage(message)
      }
    }
  }

  func processMessage(_ value: String) -> String {
    let cipher = SuperSecretCipher(useVocabularyReplacement: true, offset: 7, cycles: 3)
    switch secretMode {
    case .encode:
      return cipher.cipherRule.encipher(value)
    case .decode:
      return cipher.cipherRule.decipher(value)
    }
  }
}

enum SecretMode: String, CaseIterable, Identifiable {
  case encode, decode
  var id: Self { self }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
