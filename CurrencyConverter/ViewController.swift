//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Kaan Kalaycıoğlu on 18.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var chfLabeşl: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func presentButtonClicked(_ sender: Any) {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            
            if error != nil {
                let alert = UIAlertController(title: "Error", message:error?.localizedDescription , preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
                
                
            }
            else {
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!,options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String :Any ]{
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD : \(String(cad))"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabeşl.text = "CHF : \(String(chf))"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP : \(String(gbp))"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY : \(String(jpy))"
                                }
                                if let tryx = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY : \(String(tryx))"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD : \(String(usd))"
                                }
                            
                                
                                
                        }
                                                                        
                            
                        }
                    }catch{
                        print("error")
                    }
                    
                    
                }
                
            }
            
            
            
        }
        task.resume()
        
        
    }
}
