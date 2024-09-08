//
//  ContentView.swift
//  RandomImage
//
//  Created by 강석호 on 9/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var list = [
        "첫번째 색션",
        "두번째 색션",
        "세번째 색션",
        "네번째 색션"
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ForEach(Array(list.enumerated()), id: \.element) { index, item in
                    makeSection(item, index: index)
                }
                .padding(.leading)
            }
            .navigationTitle("My Random Image")
        }
    }
    
    func makeSection(_ title: String, index: Int) -> some View {
        VStack {
            Text(title)
                .padding(.top, 30)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            HorizontalSectionView(sectionTitle: $list[index])
        }
    }
}

#Preview {
    ContentView()
}
