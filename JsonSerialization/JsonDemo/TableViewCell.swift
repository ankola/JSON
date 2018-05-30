//
//  TableViewCell.swift
//  JsonDemo
//
//  Created by agile on 5/25/18.
//  Copyright © 2018 agile. All rights reserved.
//

import UIKit

class TableViewCell : UITableViewCell {
    
    @IBOutlet var lblFirst:UILabel!
    @IBOutlet var lblsecond:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
