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
    
    let viewModel = HymnViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.largeTitleDisplayMode = .never
        title = titleLabel
        displayDescription(with: hymnSong)
    }
    

    private func displayDescription(with song: String?) {
        let song = viewModel.filterString(string: song)
        
        hymnLabel.text = song
    }
    

}
