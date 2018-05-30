
import UIKit

struct DataStruct {
    var collectionName : String
    var country : String
    var artworkUrl100 : String
    
    init(data:[String:Any]) {
        self.collectionName = data["collectionName"]! as! String as! String
        self.artworkUrl100 = data["artworkUrl100"]! as! String;  self.country = data["country"]! as! String
    }
    
}

class SecondViewController: UIViewController, UITableViewDataSource {
    
    var artistNamearray = [DataStruct]()
    @IBOutlet var objTable:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIcall()
        print("second")
        
    }
    
    func APIcall() {
    
        var urlRequest = URLRequest.init(url: URL.init(string: "https://itunes.apple.com/search?media=music&term=bollywood")!)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            do{
                if let GetResponse = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                    
                    let resul = GetResponse["results"] as? [AnyObject]
                    // print(resul)
                    
                    for arr in resul! {
                        self.artistNamearray.append(DataStruct.init(data: arr as! [String : Any]))
                    }
                    print(self.artistNamearray)
                    DispatchQueue.main.async {
                        self.objTable.reloadData()
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistNamearray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell") as! FirstTableViewCell
        
        cell.lblFirst.text = self.artistNamearray[indexPath.row].collectionName
        cell.lblSecond.text = self.artistNamearray[indexPath.row].country
        cell.img.kf.setImage(with: URL.init(string: artistNamearray[indexPath.row].artworkUrl100))
        return cell
        
    }
    
    }

 

