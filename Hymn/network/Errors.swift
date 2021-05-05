//
//  Errors.swift
//  Hymn
//
//  Created by Andrew Ananda on 05/05/2021.
//

import Foundation

public enum Errors : Error {
    case emptyResponse
    case custom(Int, String)
}
