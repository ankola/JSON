//
//  ThirdViewController.swift
//  JsonDemo
//
//  Created by agile on 5/24/18.
//  Copyright © 2018 agile. All rights reserved.
//

import UIKit

struct ApiData {
    var EmpId : Int?
    var TeacherName : String?
    
    init(json:[String:Any]) {
        self.EmpId = json["EmpId"] as? Int
        self.TeacherName = json["TeacherName"] as? String
    }
}

class ThirdViewController: UIViewController {
    
    var arrdata = [ApiData]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func btnGet(sender : UIButton){
        
        let urlRequest = URLRequest.init(url: URL.init(string: "http://202.131.123.211/UdgamApi_v4/App_Services/UdgamService.asmx/GetAllTeacherData?StudentId=2011111")!)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            do{
                if let GetResponse : NSDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject] as! NSDictionary {
                   // print("GetResponse",GetResponse)
                    
                    let teacherDetail : [AnyObject] = ((GetResponse.object(forKey: "teacherDetail") as! NSArray) as [AnyObject])
                 //   print("teacherDetail",teacherDetail)
                    
                    for dic in teacherDetail{
                        self.arrdata.append(ApiData.init(json: dic as! [String : Any]))
                    }
                    
                  //  print(self.arrdata[0].EmpId!)
                  //  print(self.arrdata[1].TeacherName!)
                    
                   // print("arrdata",self.arrdata)
                    
                    let id = teacherDetail.map{ $0["EmpId"] }
                    print("id",id)
                    
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    @IBAction func btnPost(sender : UIButton){
        
        var urlRequest = URLRequest.init(url: URL.init(string: "http://202.131.123.211/UdgamApi_v4/App_Services/UdgamService.asmx/GetAllTeacherData")!)
        
        urlRequest.httpMethod = "POST"
        let postString = "StudentId=2011111"

       // urlRequest.httpBody = Data.init(base64Encoded: "StudentId=2011111")
        
        urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
            
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            do{
                if let getResponse = try JSONSerialization.jsonObject(with: data!, options: []) as? AnyObject {
                    print(getResponse)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
        
    }

  
    /*
     GET
     1 https://itunes.apple.com/search?media=music&term=bollywood
     
     POST
    1
    url : http://202.131.117.92:7024/v1/api/getUserDetail
    parameters :
    user_id : 5a61df2e4f2dd92403f9c629
     
     2
     http://202.131.123.211/UdgamApi_v4/App_Services/UdgamService.asmx/GetAllTeacherData
     StudentId=2011111
     
     3
     http://localhost:3000/api/v1/user_serialized/
     email=Test@test.com&password=Test1234
    */
}
