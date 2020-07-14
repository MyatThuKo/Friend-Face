//
//  UserInfo.swift
//  Friends Face
//
//  Created by Myat Thu Ko on 7/14/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import Foundation

struct UserInfo: Codable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date?
    var tags: [String]
    var friends: [Friends]
    
    var formattedRegisteredDate: String {
        if let registered = registered {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: registered)
        } else {
            return "N/A"
        }
    }
}
