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
                .font(.headline)
            Spacer()
            Button(action: {
                // View all action
            }) {
                Text("View all")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
        }
        .padding(.horizontal)
    }
}
