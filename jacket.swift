//
//  jacket.swift
//  Wishlist
//
//  Created by Leela Gilbert-Gokhale on 12/5/24.
//
import SwiftUI
import WebKit


// 1. WebView Component
struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(URLRequest(url: url))
    }
}


// 2. ProductWebView
struct Product3WebView: View {
    var urlString: String

    var body: some View {
        if let url = URL(string: urlString) {
            WebView(url: url)
                .edgesIgnoringSafeArea(.all)
        } else {
            Text("Invalid URL")
                .foregroundColor(.red)
        }
    }
}

// 3. Product Screen
struct ProductScreen: View {
    var body: some View {
        VStack(spacing: 20) {
            // Product Image
            Image("define_jacket") // Replace this with the name of your image asset
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .cornerRadius(10)
                .padding()

            // Product Title
            Text("Define Jacket Nulu")
                .font(.title2)
                .fontWeight(.bold)
            Text("$118 USD")
                .font(.title2)
                .fontWeight(.bold)
            Text("Color: Strawberry Milkshake")
                .font(.title2)

            // BUY NOW Button
            NavigationLink(destination: Product3WebView(urlString: "https://shop.lululemon.com/p/jackets-and-hoodies-jackets/Define-Jacket-Nulu/_/prod11020158?color=17441&gQT=2&gStoreCode=14002&locale=en_US&sl=US&srsltid=AfmBOop3YhbnJsYEOQj9rm7GQkddShxw8YujwO-fMtEo1K2aukOUEPZ5EIA&sz=4")) {
                Text("BUY NOW")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 252/255, green: 145/255, blue: 162/255)) // #FC91A2
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Spacer()
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 4. Preview
struct ProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductScreen()
        }
    }
}
