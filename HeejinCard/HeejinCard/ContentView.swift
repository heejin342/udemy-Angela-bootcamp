//
//  ContentView.swift
//  HeejinCard
//
//  Created by 김희진 on 2022/05/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.9, green: 0.3, blue: 0.5)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150.0, height: 150.0, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.primary, lineWidth: 5)
                    )
                Text("Heejin Kim")
                    .padding()
                    .font(.title)
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                Divider()
                InfoView(text: "010-9986-xxxx", imageName: "phone.fill")
                InfoView(text: "aaa@naver.com", imageName: "envelope.fill")

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
