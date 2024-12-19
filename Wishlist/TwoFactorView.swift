//
//  TwoFactorView.swift
//  Wishlist
//
//  Created by Leela Gilbert-Gokhale on 11/15/24.
//

import SwiftUI

struct TwoFactorView: View {
    @State private var code = ["", "", "", ""]
    // Define the custom color
        let customPink = Color(hex: "#FC91A2")

    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("Wishlist")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.pink)

            Spacer().frame(height: 30)

            // Subtitle
            Text("Enter verification code")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(customPink)

            // Instruction
            Text("Please enter the 4-digit code we sent to\n+11234567890")
                .font(.body)
                .foregroundColor(customPink)
                .multilineTextAlignment(.center)

            Spacer().frame(height: 20)

            // Code input fields
            HStack(spacing: 15) {
                ForEach(0..<4) { index in
                    TextField("", text: $code[index])
                        .frame(width: 50, height: 50)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .keyboardType(.numberPad)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(customPink, lineWidth: 1)
                        )
                }
            }
            .padding(.bottom, 30)

            // Continue button
            Button(action: {
                // Handle the continue action
            }) {
                Text("CONTINUE")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(customPink)
                                     .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            // Log in option
            VStack(spacing: 5) {
                Text("Already have an account?")
                    .foregroundColor(customPink)
                Button(action: {
                    // Handle the login action
                }) {
                    Text("LOG IN")
                        .fontWeight(.bold)
                        .foregroundColor(customPink)
                }
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TwoFactorView_Previews: PreviewProvider {
    static var previews: some View {
        TwoFactorView()
    }
}
#Preview {
    TwoFactorView()
}
