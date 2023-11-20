

import SwiftUI

struct SilhouetteView: View {
  @State var eyePosition: Double = 30.0

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Canvas { context, size in
          var hatTop = Path()
          let hatTopWidth = 80.0
          let hatTopCenterX = size.width / 2 - hatTopWidth / 2
          let hatTopRect = CGRect(origin: CGPoint(x: hatTopCenterX, y: 0), size: CGSize(width: hatTopWidth, height: 36))
          hatTop.addRoundedRect(in: hatTopRect, cornerSize: CGSize(width: 6, height: 6))
          context.fill(hatTop, with: .color(.black))

          var hatBrim = Path()
          hatBrim.addEllipse(in: CGRect(
            origin: CGPoint(x: size.width / 4, y: 30),
            size: CGSize(width: size.width / 2, height: 18))
          )
          context.fill(hatBrim, with: .color(.black))

          let centerX = size.width / 2

          var eye1 = Path()
          eye1.addRelativeArc(
            center: CGPoint(x: centerX - 20, y: 50),
            radius: 20,
            startAngle: .degrees(0),
            delta: .degrees(180)
          )
          context.fill(eye1, with: .color(.black))

          var eye2 = Path()
          eye2.addRelativeArc(
            center: CGPoint(x: centerX + 20, y: 50),
            radius: 20,
            startAngle: .degrees(0),
            delta: .degrees(180)
          )
          context.fill(eye2, with: .color(.black))
        }

        eyeBall(rect: geometry.frame(in: .local))
          .fill(Color.white)
          .offset(x: -eyePosition, y: 50)
          .animation(.easeIn(duration: 2).delay(5).repeatForever(autoreverses: true), value: eyePosition)

        eyeBall(rect: geometry.frame(in: .local))
          .fill(Color.white)
          .offset(x: -eyePosition + 40, y: 50)
          .animation(.easeIn(duration: 2).delay(5).repeatForever(autoreverses: true), value: eyePosition)
      }
    }
    .onAppear {
      eyePosition = 10.0
    }
  }

  private func eyeBall(rect: CGRect) -> Path {
    let centerX = rect.size.width / 2
    return Path { path in
      path.addRelativeArc(
        center: CGPoint(x: centerX, y: 0),
        radius: 6,
        startAngle: .degrees(0),
        delta: .degrees(180)
      )
    }
  }
}

struct SilhouetteView_Previews: PreviewProvider {
  static var previews: some View {
    SilhouetteView()
  }
}
