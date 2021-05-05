//
//  ApiResponse.swift
//  Hymn
//
//  Created by Andrew Ananda on 05/05/2021.
//

import Foundation

struct GeneralResponse<T: Codable> : Codable  {
    let status_message: String?
    let errorMessage: String?
    let message: String?
    let count: Int?
    var data: T
    
    enum CodingKeys : String, CodingKey {
        case status_message
        case errorMessage = "errors"
        case message
        case count
        case data
    }
}
