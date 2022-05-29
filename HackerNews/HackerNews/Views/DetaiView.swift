//
//  DetaiView.swift
//  HackerNews
//
//  Created by 김희진 on 2022/05/29.
//

import SwiftUI

struct DetaiView: View {
    let url: String?

    var body: some View {
        WebView(urlstring: url)
    }
}

struct DetaiView_Previews: PreviewProvider {
    static var previews: some View {
        DetaiView(url: "https://www.google.com")
    }
}
