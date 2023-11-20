

import SwiftUI
import CoreImage.CIFilterBuiltins

struct StripedBackground: View {
  private static let context = CIContext()

  var primary: Color
  var secondary: Color

  var body: some View {
    Canvas {context, size in
      let dimention: Double = size.width > size.height ? size.width : size.height

      for point in stride(from: 5, to: dimention * 2, by: 5) {
        var path = Path()
        path.move(to: CGPoint(x: point, y: 0))
        path.addLine(to: CGPoint(x: 0, y: point))
        let color = point.truncatingRemainder(dividingBy: 2) == 0 ? secondary : primary
        context.stroke(path, with: .color(color), lineWidth: 5)
      }
    }
  }
}

struct StripedBackground_Previews: PreviewProvider {
  static var previews: some View {
    StripedBackground(primary: .red, secondary: .black.opacity(0.7))
  }
}
