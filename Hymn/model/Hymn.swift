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
    let categoryId: Int
    let createdAt: String?
    let updatedAt: String
    var category: Category?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case songNumber = "number"
        case chorus
        case song
        case categoryId = "category_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case category
    }
}

struct Category: Codable {
    let id: Int
    let name: String
    let createdAt: String?
    let updatedAt : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
