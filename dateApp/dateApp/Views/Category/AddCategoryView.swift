//
//  AddCategoryView.swift
//  dateApp
//
//  Created by 이민호 on 1/28/24.
//

import SwiftUI

enum CategoryColor: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    
    case red = "ff0000"
    case blue = "0000ff"
    case navy = "#003366"
    case purple = "#8a2be2"
    case yellow = "ffff66"
    case lightGreen = "a0db8e"
    
    func getColorName() -> String {
        switch self {
            case .red:
                return "빨간색"
            case .blue:
                return "파란색"
            case .navy:
                return "남색"
            case .purple:
                return "보라색"
            case .yellow:
                return "노란색"
            case .lightGreen:
                return "연두색"
        }
    }
}

struct AddCategoryView: View {
    @State var categoryName = ""
    @State var selectedColor: CategoryColor = .red
    @Binding var isAddingCategory: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("카테고리 이름")) {
                    TextField("카테고리 이름 입력", text: $categoryName)
                }
                
                Section(header: Text("색상선택")) {
                    List {
                        ForEach (CategoryColor.allCases, id: \.self) { color in
                            HStack {
                                Circle()
                                    .frame(width: 20)
                                    .foregroundColor(Color(hex: color.rawValue))
                                    .padding(.trailing, 10)
                                Text(color.getColorName())
                                
                                Spacer()
                                
                                if color == selectedColor {
                                    ZStack {
                                        Image(systemName: "checkmark")
                                            .font(.system(size: 12))
                                        Circle()
                                            .stroke()
                                            .frame(width: 20)
                                    }
                                    .foregroundStyle(.red)
                                }
                            }
                            .onTapGesture {
                                self.selectedColor = color
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("카테고리 추가")
                        .font(.headline)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isAddingCategory.toggle()
                    } label: {
                        Text("확인")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button {
                            isAddingCategory.toggle()
                        } label: {
                            Text("취소")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddCategoryView(isAddingCategory: .constant(true))
}
