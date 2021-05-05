//
//  Hymn.swift
//  Hymn
//
//  Created by Andrew Ananda on 05/05/2021.
//

import Foundation

struct Hymn: Codable {
    let id: Int
    let title: String
    let songNumber: Int
    let chorus: String
    let song: String
    let category_id: Int
    let created_at: String
    let updated_at: String
    let category: Category
}

struct Category: Codable {
    let id: Int
    let name: String
    let createdAt: String
    let updatedAt : String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
