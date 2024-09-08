//
//  PosterDetailView.swift
//  RandomImage
//
//  Created by 강석호 on 9/8/24.
//

import SwiftUI

struct PosterDetailView: View {
    
    let image: Image?
    
    var body: some View {
        VStack {
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } else {
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
        .navigationTitle("Detail View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PosterDetailView(image: Image(systemName: "star"))
}
