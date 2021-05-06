//
//  HymnViewModel.swift
//  Hymn
//
//  Created by Andrew Ananda on 05/05/2021.
//

import Foundation
import RxSwift
import RxRelay

class HymnViewModel {
    private let hymnRepository: HymnRepository
    
     var hymns = PublishSubject<[Hymn]>()
     var showLoading = BehaviorRelay<Bool>(value: true)
    
    init() {
        self.hymnRepository = HymnRepository()
    }
    
    
    func fetchHymns() {
        hymnRepository.hymnLiveData.subscribe(onNext: { [weak self] hymnData in
            self?.hymns.onNext(hymnData)
            self?.showLoading.accept(false)
        })
        hymnRepository.fetchHymns()
    }
}
