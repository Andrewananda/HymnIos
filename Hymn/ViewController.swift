//
//  ViewController.swift
//  Hymn
//
//  Created by Andrew Ananda on 02/05/2021.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let hymnViewModel =  HymnViewModel()
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchHymnData()
    }
    
    private func fetchHymnData() {
        hymnViewModel.hymnObservable.asObservable()
            .subscribe(onNext: { [weak self] hymns in
                self?.printData(data: hymns)
            })
            .disposed(by: bag)
        hymnViewModel.fetchHymns()
    }

    private func printData(data: [Hymn]) {
        print("Hymn Data \(data)")
    }

}

