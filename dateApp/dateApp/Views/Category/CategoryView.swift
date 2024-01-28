//
//  CategoryView.swift
//  dateApp
//
//  Created by 이민호 on 1/21/24.
//

import SwiftUI

struct CategoryView: View {
    @State var isAddingCategory = false
    
    var body: some View {
        NavigationStack {
            List(0...9, id: \.self) { number in
                HStack {
                    Circle()
                        .frame(width: 15)
                        .foregroundColor(.red)
                        .padding(.trailing, 10)
                    VStack {
                        Text("\(number)")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("카테고리")
                        .font(.headline)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isAddingCategory.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 18))
                    }
                }
            }
            .sheet(isPresented: $isAddingCategory) {
                AddCategoryView(isAddingCategory: $isAddingCategory)
            }
        }
    }
}

#Preview {
    CategoryView()
}
