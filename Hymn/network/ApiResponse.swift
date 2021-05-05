//
//  ApiResponse.swift
//  Hymn
//
//  Created by Andrew Ananda on 05/05/2021.
//

import Foundation

struct GeneralResponse<T : Codable> : Codable  {
    let status_message: String
    let error: String?
    let message: String
    let count: Int
    let data: T
    
    enum CodingKeys : String, CodingKey {
        case status_message
        case error = "errors"
        case message
        case count
        case data
    }
}
