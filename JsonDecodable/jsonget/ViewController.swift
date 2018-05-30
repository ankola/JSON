import UIKit
struct JsonData:Decodable {
    let name:String
    let capital:String
    let alpha2Code:String
    let alpha3Code:String
    let subregion:String
    let region:String

}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
     @IBOutlet var objtablview: UITableView!
    var arrdata = [JsonData]()
    var value = ["1","2","3","4","5","6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var value = ["1","2","3","4","5","6"]
        var arrdata = [JsonData]()
        // Do any additional setup after loading the view, typically from a nib.
        getdata()
        objtablview.delegate = self
        objtablview.dataSource = self
    }
    
    
    func getdata() {
        var url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{if error == nil{
                self.arrdata = try JSONDecoder().decode([JsonData].self, from: data!)
                for mainarr in self.arrdata{
                    // print(mainarr.name,":",mainarr.capital)
                    DispatchQueue.main.async {
                        self.objtablview.reloadData()
                    }
                }
                }
            }
            catch{
                print("error in jdson get data")
            }
            }.resume()
    }
   
    // TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Tcell") as! MainTableViewCell
       
        cell.objlblCapital.text = arrdata[indexPath.row].capital
        cell.objlblName.text = arrdata[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objstoryboard : DettailsViewController = storyboard?.instantiateViewController(withIdentifier: "DettailsViewController")as! DettailsViewController
        objstoryboard.strName = arrdata[indexPath.row].name
        objstoryboard.strCapital = arrdata[indexPath.row].capital
        objstoryboard.strAlpha3 = arrdata[indexPath.row].alpha2Code
        objstoryboard.strAlpha3 = arrdata[indexPath.row].alpha3Code
        objstoryboard.strSubRergion = arrdata[indexPath.row].subregion
        objstoryboard.strRegion = arrdata[indexPath.row].region

        self.navigationController?.pushViewController(objstoryboard, animated: true)
        
    }
}
