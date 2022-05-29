//
//  WebView.swift
//  HackerNews
//
//  Created by 김희진 on 2022/05/29.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
        
    let urlstring: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlstring {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}

