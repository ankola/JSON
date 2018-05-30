//
//  ViewController.swift
//  JsonDemo
//
//  Created by agile on 5/23/18.
//  Copyright © 2018 agile. All rights reserved.
//

import UIKit

struct dataJson {
    let title:String
    let id:Int
    init(json:JSON) {
        self.title = json["title"].stringValue
        self.id = json["id"].intValue
    }
}

class ViewController: UIViewController {

var arrofdict2 = [dataJson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
      callAPI()
    }

    func callAPI() {
        
       // var urlRequest = URLRequest.init(url: URL.init(string: "https://jsonplaceholder.typicode.com/posts")!)
        var urlRequest = URLRequest.init(url: URL.init(string: "http://202.131.123.211/UdgamApi_v4/App_Services/UdgamService.asmx/GetAllTeacherData?StudentId=2011111")!)
        
        urlRequest.httpMethod = "GET"
      //  urlRequest.httpBody = Data.init(base64Encoded: "<#T##String#>")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            do{
                if let arr = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject] {
                    print(arr)
                }
            }catch{
                print(error.localizedDescription)
            }
            
        
        }
      
    }
    

}

