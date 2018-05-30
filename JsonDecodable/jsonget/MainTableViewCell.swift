//
//  MainTableViewCell.swift
//  jsonget
//
//  Created by agile on 4/16/18.
//  Copyright © 2018 agile. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var objlblName: UILabel!
    @IBOutlet var objlblCapital: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
