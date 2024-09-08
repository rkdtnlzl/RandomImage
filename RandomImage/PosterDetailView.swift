//
//  PosterDetailView.swift
//  RandomImage
//
//  Created by 강석호 on 9/8/24.
//

import SwiftUI

struct PosterDetailView: View {
    
    @Binding var sectionTitle: String
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
            
            TextField("섹션 제목 입력", text: $sectionTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.gray.opacity(0.2))
        }
    }
}

#Preview {
    PosterDetailView(sectionTitle: .constant(""), image: Image(systemName: "star"))
}
