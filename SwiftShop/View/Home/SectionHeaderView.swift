//
//  SectionHeaderView.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

import SwiftUI

// Section Header View
struct SectionHeaderView: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
            Spacer()
            Button(action: {
            }) {
                Text("View all")
                    .font(.subheadline)
            }
        }
        .padding(.horizontal)
    }
}
