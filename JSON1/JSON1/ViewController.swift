//
//  ViewController.swift
//  JSON1
//
//  Created by agile-14 on 01/05/17.
//  Copyright © 2017 agile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        getcall()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func btnget(_ sender: UIButton) {
    
    
    
        let urlpath : String = "http://202.131.123.211/UdgamApi_v4/App_Services/UdgamService.asmx/GetAllTeacherData?StudentId=2011111"
        
        let url = URL(string: urlpath)
        
        var urlrequest = URLRequest(url: url!)
        
        urlrequest.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        
        
        
        let task = session.dataTask(with: urlrequest) { (data, response, error) in
            
            do {
                
                guard let getResponseDic = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                    else
                {
                    print("error trying to convert data to JSON")
                    return
                }
                // now we have the todo, let's just print it to prove we can access it
                
                let dic = getResponseDic as NSDictionary
                print("getResponseDic",dic)
                
                let msg = dic.object(forKey: "message")
                print("msg",msg)
                
                let arrObj = dic.object(forKey: "teacherDetail") as! NSArray
                print("TEACHER DETTAILS",arrObj)
                
                let id = dic.object(forKey: "EmpId")
                print("id",id)
                
                
               // let arr = dic.value(forKey: "TeacherName")as! NSArray
                
                print(((dic.value(forKey: "teacherDetail") as! NSArray).object(at: 0) as! NSDictionary).value(forKey: "TeacherName") as! String)
                
                
                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
                
                // print("The title is: " + todoTitle)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            
            
            
            
        }
        
        task.resume()
        

        
        
        
    
    
    }
    
    
    

    @IBAction func btnpost(_ sender: UIButton) {
        
        
        let urlpath : String = "http://202.131.123.211/UdgamApi_v4/App_Services/UdgamService.asmx/GetAllTeacherData"
        
        let url = URL(string: urlpath)
        
        var urlrequest = URLRequest(url: url!)
        
        let postString = "StudentId=2011111"
        
        urlrequest.httpMethod = "POST"
        
        urlrequest.httpBody = postString.data(using: String.Encoding.utf8)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        
        
        
        let task = session.dataTask(with: urlrequest) { (data, response, error) in
            
            do {
                
                guard let getResponseDic = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                    else
                {
                    print("error trying to convert data to JSON")
                    return
                }
                // now we have the todo, let's just print it to prove we can access it
                
                print(getResponseDic as NSDictionary)
                
                let dic = getResponseDic as NSDictionary
                let msg = dic.object(forKey: "message")
                
                print(msg)
                let arrObj = dic.object(forKey: "teacherDetail") as! NSArray
                print(arrObj)
                
                
                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
                
                // print("The title is: " + todoTitle)
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            
            
            
            
        }
        
        task.resume()
        

        
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

