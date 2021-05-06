//
//  HymnTableCell.swift
//  Hymn
//
//  Created by Andrew Ananda on 06/05/2021.
//

import UIKit

class HymnTableCell: UITableViewCell {

    @IBOutlet weak var hymnNumber: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var chorus: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
