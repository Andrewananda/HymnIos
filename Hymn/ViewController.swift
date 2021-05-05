//
//  ViewController.swift
//  Hymn
//
//  Created by Andrew Ananda on 02/05/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let hymnViewModel =  HymnViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hymnViewModel.fetchHymns()
    }


}

