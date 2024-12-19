import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let r, g, b, a: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17, 255)
        case 6: // RGB (24-bit)
            (r, g, b, a) = (int >> 16, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8: // ARGB (32-bit)
            (r, g, b, a) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b, a) = (255, 255, 255, 255)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#FFFCFD")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Wishlist")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color(hex: "#FC91A2"))
                    
                    
                    Spacer()
                    
                    Button(action: {
                        print("Get Started button tapped")
                    }) {
                        NavigationLink(destination: SignupView()) {
                            Text("Get Started")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(hex: "FC91A2"))
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}
struct SignupView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Wishlist")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
                .background(Color(hex: "#FFCBD0")) // Light pink background
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
            
            Text("Create an Account")
                .font(.title2)
                .foregroundColor(Color(hex: "#FC91A2"))
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color(hex: "#FC91A2"))
                    Text("Username")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "#FC91A2"))
                }
                Divider().background(Color(hex: "#FC91A2"))
                
                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color(hex: "#FC91A2"))
                    Text("Password")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "#FC91A2"))
                }
                Divider().background(Color(hex: "#FC91A2"))
                
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(Color(hex: "#FC91A2"))
                    Text("SMS / Phone")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "#FC91A2"))
                }
                Divider().background(Color(hex: "#FC91A2"))
            }
            .padding(.horizontal)
            
            Button(action: {
                print("Continue button tapped")
            }) {
                NavigationLink(destination: TwoFactorView()) {
                    Text("CONTINUE")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "#F8A8B3"))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Text("Already have an account?")
                    .foregroundColor(Color(hex: "#FC91A2"))
                
                Button(action: {
                    print("Log In button tapped")
                }) {
                    Text("LOG IN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "#F8A8B3"))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
   

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
