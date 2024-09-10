//
//  MainView.swift
//  SwiftShop
//
//  Created by Jinu on 10/09/2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        ZStack {
            
            Color(hex:"#9EC65C").ignoresSafeArea()
            
            VStack {
                    TopBarView()
                        HomeView(viewModel: viewModel)
                            .frame(maxWidth: .infinity)
//                        .padding(.top, 20)
                        .shadow(radius: 5)

                }
            }
//            .padding(.top)

    }
}

