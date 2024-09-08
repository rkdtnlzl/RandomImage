//
//  ContentView.swift
//  RandomImage
//
//  Created by 강석호 on 9/8/24.
//

import SwiftUI


struct ContentView: View {
    let list = [
        "첫번째 색션",
        "두번째 색션",
        "세번째 색션",
        "네번째 색션"
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ForEach(list, id: \.self) { item in
                    makeSection(item)
                }
                .padding(.leading)
            }
            .navigationTitle("My Random Image")
        }
    }
    
    func makeSection(_ title: String) -> some View {
        VStack {
            Text(title)
                .padding(.top, 30)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            HorizontalSectionView()
        }
    }
}

#Preview {
    ContentView()
}
