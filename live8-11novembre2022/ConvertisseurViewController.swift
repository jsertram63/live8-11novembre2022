//
//  ConvertisseurViewController.swift
//  live8-11novembre2022
//
//  Created by Lunack on 11/11/2022.
//

import UIKit

class ConvertisseurViewController: UIViewController {
    

    @IBOutlet weak var temperatureEnCelsus: UILabel!
    
    @IBOutlet weak var temperatureEnFarenheit: UILabel!
    
    
    @IBOutlet weak var zoneDeSaisieTextField: UITextField!
    var temperatureACouvertir : Double = 0
    var temperatureEnF : Double = 0
    

    @IBOutlet weak var bouttonConverssion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyBoard))
                view.addGestureRecognizer(tap)
        zoneDeSaisieTextField.delegate = self
        bouttonConverssion.layer.cornerRadius = bouttonConverssion.frame.height / 2
       


        // Do any additional setup after loading the view.
    }
    
    @objc func closeKeyBoard() {
        temperatureEnCelsus.text = "\(temperatureACouvertir) °C"
        print(temperatureEnCelsus.text)
        
            view.endEditing(true)
        }
    
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    override func viewDidAppear(_ animated: Bool) {
    
 
       
    }
    
    @IBAction func convertirTemperature(_ sender: UIButton) {
      
        
        print("bouton pressé")
        temperatureEnF = (temperatureACouvertir * 9 / 5) + 32
        temperatureEnFarenheit.text = "\(temperatureEnF) °F"
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ConvertisseurViewController : UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("On commence a édité la zone de saisie \(String(describing: textField.text))")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
     
        print(temperatureACouvertir)
        
        return true
        
    }
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("Le texte saisi est : \(String(describing: textField.text))")
        temperatureACouvertir = Double(textField.text ?? "") ?? 1
    }
    
    
}
