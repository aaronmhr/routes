//
//  OnboardingView.swift
//  Ruta
//
//  Created by Aaron on 30/11/2023.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isActive: Bool = false

    var body: some View {

        ZStack {

            Color(red: 190, green: 233, blue: 255)
                .opacity(0.2)
                .ignoresSafeArea()


            VStack(spacing: 24) {
                Image("onboarding-clay-color")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .mask(SquircleShape(curve: 40))
                    .padding(.horizontal)

                // Illustration and text here
                HStack {
                    Text("Welcome \n to the Ruta App!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)

                    Spacer()
                }
                .padding(.horizontal)

                HStack {
                    Text("Discover and explore amazing destinations, find hidden gems, and local favorites. \nPlan your journey today!")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.secondary)

                    Spacer()
                }
                    .padding(.horizontal)

                Spacer()

                Button(action: {
                    self.isActive = true
                }, label: {
                    Text("Try it now!")
                })
                .buttonStyle(PressableButtonStyle())

                Spacer()
            }
        }
        .fullScreenCover(isPresented: $isActive, content: LoginView.init)
    }
}

#Preview {
    OnboardingView()
}

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 200, minHeight: 52)
            .background(
                Rectangle()
                    .mask(SquircleShape())
                    .foregroundStyle(
                        (configuration.isPressed ? Color.darkBlue : Color.blue)
                            .shadow(.inner(color: Color.lightBlue.opacity(0.4), radius: 4, x: 7, y: 7))
                            .shadow(.inner(color: Color.darkBlue.opacity(0.4), radius: 8, x: -10, y: -10))
                    )
                    .shadow(color: .blue.opacity(0.2), radius: 20, x: 0, y: 20)
            )
    }
}


extension Color {
    /// Initializes and returns a color object using the specified opacity and RGB component values.
    /// - Parameters:
    ///   - red: The red component of the color object, specified as a value from 0 to 255.
    ///   - green: The green component of the color object, specified as a value from 0 to 255.
    ///   - blue: The blue component of the color object, specified as a value from 0 to 255.
    ///   - opacity: The opacity value of the color object, specified as a value from 0.0 to 1.0.
    init(red: Int, green: Int, blue: Int, opacity: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0,
            opacity: opacity
        )
    }
}


extension Color {
    static func saturated(_ color: Color, saturation: CGFloat) -> Color {
        let uiColor = UIColor(color)
        var hue: CGFloat = 0
        var saturationValue: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0

        uiColor.getHue(&hue, saturation: &saturationValue, brightness: &brightness, alpha: &alpha)

        return Color(UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
    }

    static func darker(_ color: Color, brightness: CGFloat) -> Color {
        let uiColor = UIColor(color)
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightnessValue: CGFloat = 0
        var alpha: CGFloat = 0

        uiColor.getHue(&hue, saturation: &saturation, brightness: &brightnessValue, alpha: &alpha)

        return Color(UIColor(hue: hue, saturation: saturation, brightness: brightness * brightness, alpha: alpha))
    }
}

struct SquircleShape: Shape {
    let curve: CGFloat

    init(curve: CGFloat = 20) {
        self.curve = curve
    }

    func path(in rect: CGRect) -> Path {
        // This function creates a path that resembles a squircle.
        // Adjust the control points and values to fine-tune the squircle shape.
        var path = Path()

        let width = rect.size.width
        let height = rect.size.height
        let curveAmount: CGFloat = curve // Adjust this value to change the curvature

        path.move(to: CGPoint(x: width - curveAmount, y: height))
        path.addLine(to: CGPoint(x: curveAmount, y: height))
        path.addQuadCurve(to: CGPoint(x: 0, y: height - curveAmount), control: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: curveAmount))
        path.addQuadCurve(to: CGPoint(x: curveAmount, y: 0), control: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width - curveAmount, y: 0))
        path.addQuadCurve(to: CGPoint(x: width, y: curveAmount), control: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height - curveAmount))
        path.addQuadCurve(to: CGPoint(x: width - curveAmount, y: height), control: CGPoint(x: width, y: height))

        return path
    }
}
