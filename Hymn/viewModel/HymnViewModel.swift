//
//  HymnViewModel.swift
//  Hymn
//
//  Created by Andrew Ananda on 05/05/2021.
//

import Foundation
import RxSwift

class HymnViewModel {
    private let hymnRepository: HymnRepository
    
     var hymnSubject = PublishSubject<[Hymn]>()
    var hymnObservable : Observable<[Hymn]> {
        hymnSubject as Observable
    }
    
    init() {
        self.hymnRepository = HymnRepository()
    }
    
    
    func fetchHymns() {
        hymnRepository.hymnLiveData.subscribe(onNext: { [weak self] hymnData in
            self?.hymnSubject.onNext(hymnData)
        })
        hymnRepository.fetchHymns()
    }
}
