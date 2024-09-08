//
//  HorizontalSectionView.swift
//  RandomImage
//
//  Created by 강석호 on 9/8/24.
//

import SwiftUI

struct HorizontalSectionView: View {
    
    let urls = [
        "https://picsum.photos/200/300?random=1",
        "https://picsum.photos/200/300?random=2",
        "https://picsum.photos/200/300?random=3",
        "https://picsum.photos/200/300?random=4",
        "https://picsum.photos/200/300?random=5",
        "https://picsum.photos/200/300?random=6"
    ]
    
    @Binding var sectionTitle: String
    
    @State private var selectedImage: Image? = nil
    @State private var isDetailViewActive = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(urls, id: \.self) { url in
                        PosterView(url: url) { image in
                            selectedImage = image
                            isDetailViewActive = true
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $isDetailViewActive) {
                PosterDetailView(sectionTitle: $sectionTitle, image: selectedImage)
            }
        }
    }
}

#Preview {
    HorizontalSectionView(sectionTitle: .constant("Sample Section"))
}
