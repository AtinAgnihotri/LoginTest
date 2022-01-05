//
//  LikeButton.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import SwiftUI

struct LikeButton: View {
    let action: () -> Void
    @Binding var isLiked: Bool
    
    var body: some View {
        Button(action: action) {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .foregroundColor(.red)
                .padding()
        }
        .padding()
    }
}

