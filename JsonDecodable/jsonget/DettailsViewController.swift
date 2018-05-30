//
//  DettailsViewController.swift
//  jsonget
//
//  Created by agile on 4/17/18.
//  Copyright © 2018 agile. All rights reserved.
//

import UIKit

class DettailsViewController: UIViewController {
    
    var strName:String = ""
     var strCapital:String = ""
     var strAlpha2:String = ""
     var strAlpha3:String = ""
     var strRegion:String = ""
     var strSubRergion:String = ""
    
    
    @IBOutlet var lblNamed: UILabel!
    @IBOutlet var lblCapitald: UILabel!
    @IBOutlet var lblRegiond: UILabel!
    @IBOutlet var lblSubRegiond: UILabel!
    @IBOutlet var lblAlpha3d: UILabel!
    @IBOutlet var lblAlpha2d: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        lblNamed.text = strName
        lblCapitald.text = strCapital
        lblAlpha2d.text = strAlpha2
        lblAlpha3d.text = strAlpha3
        lblSubRegiond.text = strSubRergion
        lblRegiond.text = strRegion
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
