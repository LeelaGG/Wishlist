//
//  WebView.swift
//  Wishlist
//
//  Created by Leela Gilbert-Gokhale on 12/5/24.
//

import SwiftUI
import WebKit

// 1. WebView Component
struct ProductWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(URLRequest(url: url))
    }
}

// 2. ProductWebView
struct Product2WebView: View {
    var urlString: String

    var body: some View {
        if let url = URL(string: urlString) {
            ProductWebView(url: url)
                .edgesIgnoringSafeArea(.all)
        } else {
            Text("Invalid URL")
                .foregroundColor(.red)
        }
    }
}

// 3. ProductListView (List of Products with Links)
struct ProductListView: View {
    let products = [
        ("Lulu Define Jacket", "https://shop.lululemon.com/p/jackets-and-hoodies-jackets/Define-Jacket/_/prod5020694?sz=4"),
        ("Target Bathing Suit", "https://www.target.com/p/women-s-triangle-bikini-top-wild-fable/-/A-89198116?preselect=89179008#lnk=sametab"),
        ("White Fox Hoodie", "https://whitefoxboutique.com/products/era-8-oversized-hoodie-galaxy?variant=40932567842876")
    ]

    var body: some View {
        NavigationView {
            List(products, id: \.0) { product in
                if let url = URL(string: product.1) {
                    NavigationLink(
                        destination: ProductWebView(url: url)
                    ) {
                        Text(product.0)
                    }
                }
            }
            .navigationTitle("Products") // Move here
        }
    }
}

// Dummy ProductWebView for demonstration
struct Product4WebView: View {
    let url: URL
    var body: some View {
        Text("WebView for \(url.absoluteString)")
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
