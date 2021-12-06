//
//  ViewController.swift
//  TicTacToeApp
//
//  Created by Malcolm Lennartsson on 2021-11-23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var crossCounter: UILabel!
    
    @IBOutlet weak var circleCounter: UILabel!
    
    @IBOutlet weak var winLabel: UILabel!
    
    var crossCount = 0
    var circleCount = 0
    var whoIsPlaying = 1
    
    let gameLogic = GameLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func putCrossOrCircle(_ sender: UIButton) {
            
            if gameLogic.changeStateOfGame(place: sender.tag-1, marker: whoIsPlaying) {
                switch whoIsPlaying {
                case 1:
                    sender.setImage(UIImage(named: "Cross.png"), for: .normal)
                    whoIsPlaying = 2
                
                case 2:
                    sender.setImage(UIImage(named: "Circle.png"), for: .normal)
                    whoIsPlaying = 1
                default:
                    return
                
            }
            
        
        }
        
        declareWinner(winner: gameLogic.whoIsWinner(), isDraw: gameLogic.callDraw())
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {

        gameLogic.resetGame()
        
        playAgainButton.isHidden = true
        winLabel.isHidden = true
        
        for i in 1...9 {
            if let button = view.viewWithTag(i) as? UIButton {
            button.setImage(UIImage(named: "emptyImage.png"), for: .normal)
       }
            
    }
    
}
    
    
    func declareWinner(winner: Int, isDraw: Bool) {
        
        if winner == 1 {
            whoIsPlaying = 3
            crossCount += 1
            crossCounter.text = ("Cross: \(crossCount)")
            print("\(crossCount)")
            winLabel.isHidden = false
            winLabel.text = "Cross has won"
            playAgainButton.isHidden = false
        } else if winner == 2 {
            whoIsPlaying = 3
            circleCount += 1
            circleCounter.text = ("Circle: \(circleCount)")
            winLabel.isHidden = false
            winLabel.text = "Circle has won"
            playAgainButton.isHidden = false
        }
        
        if isDraw {
            winLabel.isHidden = false
            playAgainButton.isHidden = false
            winLabel.text = "Draw"
        }
    
    }
    

    
    
    
}







