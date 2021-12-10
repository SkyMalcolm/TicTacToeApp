//
//  NameViewController.swift
//  TicTacToeApp
//
//  Created by Malcolm Lennartsson on 2021-12-09.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var playerOneName: UITextField!
    @IBOutlet weak var playerTwoName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ViewController {
            controller.nameOne = playerOneName?.text
            controller.nameTwo = playerTwoName?.text
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "goToGame" {
            if playerOneName.text!.isEmpty {
                return false
            }
            if playerTwoName.text!.isEmpty {
                return false
            }
            return true
        }
        
        return true
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
