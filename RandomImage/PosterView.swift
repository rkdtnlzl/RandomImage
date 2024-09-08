//
//  PosterView.swift
//  RandomImage
//
//  Created by 강석호 on 9/8/24.
//

import SwiftUI

struct PosterView: View {
    
    let url: String
    var onImageSelected: (Image) -> Void = { _ in }
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { data in
            switch data {
            case .empty:
                ProgressView()
                    .frame(width: 100, height: 150)
            case .success(let image):
                image
                    .resizable()
                    .frame(width: 100, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .onTapGesture {
                        onImageSelected(image)
                    }
            case .failure(_):
                Image(systemName: "star")
                    .frame(width: 100, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            @unknown default:
                Image(systemName: "star")
                    .frame(width: 100, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}

#Preview {
    PosterView(url: "https://picsum.photos/200/300")
}
