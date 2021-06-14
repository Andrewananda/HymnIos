//
//  Constants.swift
//  Hymn
//
//  Created by Andrew Ananda on 05/05/2021.
//

import Foundation

struct K {
    struct endpoint {
        static let BASE_URL = "http://hymn.devstart.co.ke/api/"
        static let songs = "songs"
        static let search = "search"
    }
    struct tableCells {
        static let hymnCellIdentifier = "hymnTableCell"
        static let hymnTableCell = "HymnTableCell"
    }
    struct segueIdentifier {
        static let hymnSegue = "HymnViewController"
    }
}
