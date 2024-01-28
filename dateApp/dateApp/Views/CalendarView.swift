//
//  CalendarView.swift
//  dateApp
//
//  Created by 이민호 on 1/18/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    @State private var isAddDateSheetUp = false
    @State private var isFindDateSheetUp = false
    
    var body: some View {
        NavigationStack {
            
            DatePicker (
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .navigationBarTitleDisplayMode(.inline)
            .datePickerStyle(.graphical)
            .environment(\.locale, .init(identifier: "ko_KR"))
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    Text("달력")
                        .font(.headline)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            isFindDateSheetUp.toggle()
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 15))
                        }
                        
                        Button {
                            isAddDateSheetUp.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 18))
                        }
                    }
                }
            }
                        
            Spacer()
            
        }
    }
}

#Preview {
    CalendarView()
}
