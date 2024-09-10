//
//  TopBarView.swift
//  SwiftShop
//
//  Created by Jinu on 10/09/2024.
//

import SwiftUI

struct TopBarView: View {
    @State var text: String = ""
    var body: some View {
        HStack {
            Button(action: {
            }) {
                Image(systemName: "cart")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
            }

            Spacer()
            
            HStack {
                TextField("Search", text: $text)
                    .foregroundColor(.gray)
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(10)
            .frame(height: 40)

            Spacer()
            
            Button(action: {
            }) {
                ZStack {
                    Image(systemName: "bell")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 10, height: 10)
                        .offset(x: 10, y: -10)
                }
            }
        }
        .padding()
//        .background(Color.green)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            TopBarView()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
