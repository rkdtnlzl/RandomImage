//
//  CategoryView.swift
//  RandomImage
//
//  Created by 강석호 on 9/8/24.
//

import SwiftUI

struct Category: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let count: Int
}

struct CategoryView: View {
    
    @State private var text = ""
    
    let list = [
        "SF",
        "가족",
        "스릴러",
        "로맨스"
    ]

    @State private var categories: [Category] = [
        Category(name: "SF", count: .random(in: 1...100)),
        Category(name: "가족", count: .random(in: 1...100)),
        Category(name: "스릴러", count: .random(in: 1...100)),
        Category(name: "로맨스", count: .random(in: 1...100)),
    ]
    
    var filteredCategories: [Category] {
        return text.isEmpty ? categories : categories.filter { $0.name.contains(text) }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredCategories) { item in
                    NavigationLink {
                        SearchDetailView()
                    } label: {
                        HStack {
                            Image(systemName: "person")
                            Text("\(item.name)(\(item.count))")
                        }
                    }
                }
            }
            .navigationTitle("영화 검색")
            .searchable(text: $text,
                        placement: .navigationBarDrawer,
                        prompt: "영화를 검색하세요"
            )
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        let newCategory = Category(name: list.randomElement()!, count: .random(in: 1...100))
                        categories.append(newCategory)
                    }, label: {
                        Text("추가")
                    })
                }
            }
        }
    }
}

#Preview {
    CategoryView()
}
