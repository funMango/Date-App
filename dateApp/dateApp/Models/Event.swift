//
//  UserDate.swift
//  dateApp
//
//  Created by 이민호 on 1/21/24.
//

import Foundation

struct Event: Identifiable {
    var id: String = UUID().uuidString
    var date: Date
    var title: String
    var content: String
    var location: String
    var alarm: String?
    var time: Time
}
