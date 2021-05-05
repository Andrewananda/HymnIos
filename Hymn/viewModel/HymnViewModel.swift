//
//  HymnViewModel.swift
//  Hymn
//
//  Created by Andrew Ananda on 05/05/2021.
//

import Foundation

class HymnViewModel {
    
    private let hymnRepository: HymnRepository
    
    init() {
        self.hymnRepository = HymnRepository()
    }
    
    func fetchHymns() {
        self.hymnRepository.fetchHymns()
    }
}
