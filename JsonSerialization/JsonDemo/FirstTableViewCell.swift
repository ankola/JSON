//
//  FirstTableViewCell.swift
//  JsonDemo
//
//  Created by agile on 5/25/18.
//  Copyright © 2018 agile. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet var lblSecond: UILabel!
    @IBOutlet var lblFirst: UILabel!
    @IBOutlet var img:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
