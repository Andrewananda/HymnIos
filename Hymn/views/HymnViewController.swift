//
//  HymnViewController.swift
//  Hymn
//
//  Created by Andrew Ananda on 06/05/2021.
//

import UIKit

class HymnViewController: UIViewController {
    @IBOutlet weak var hymnLabel: UILabel!
     var titleLabel: String?
    var hymnSong: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDescription()
    }
    

    private func setDescription() {
        title = titleLabel
        let song = hymnSong?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        hymnLabel.text = song
    }

}
