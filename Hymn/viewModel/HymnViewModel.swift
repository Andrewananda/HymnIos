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
    
     private let hymns = PublishSubject<[Hymn]>()
    var hymnObservable: Observable<[Hymn]> {
        return hymns.asObserver()
    }
    
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
    
    func searchHymn(value: String) {
        hymnRepository.hymnLiveData.subscribe(onNext: {[weak self] hymnData in
            self?.hymns.onNext(hymnData)
            self?.showLoading.accept(false)
        })
        print("Value \(value)")
        hymnRepository.searchHymn(value: value)
    }
    
    func filterString(string: String?) -> String {
        let value = string?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        return value!
    }
}
