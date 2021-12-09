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
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    var crossCount = 0
    var circleCount = 0
    var whoIsPlaying = 1
    
    let game = Game()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        turnLabel.text = "X"
        
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func putCrossOrCircle(_ sender: UIButton) {
        
        let placeMarker = game.changeStateOfGame(place: sender.tag-1, marker: whoIsPlaying)
        
        if placeMarker {
            switch whoIsPlaying {
            case 1:
                turnLabel.text = "O"
                sender.setImage(UIImage(named: "Cross.png"), for: .normal)
                whoIsPlaying = 2
                
            case 2:
                turnLabel.text = "X"
                sender.setImage(UIImage(named: "Circle.png"), for: .normal)
                whoIsPlaying = 1
            default:
                return
                
            }
            
            declareWinner(winner: game.decideWinner())
            declareDraw(isDraw: game.callDraw())
            
            
    
        }
        
        
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        
        game.resetGame()
        whoIsPlaying = 1
        
        playAgainButton.isHidden = true
        winLabel.isHidden = true
        turnLabel.text = "X"
        turnLabel.isHidden = false
        
        for i in 1...9 {
            if let reset = view.viewWithTag(i) as? UIButton {
                reset.setImage(UIImage(named: "emptyImage.png"), for: .normal)
            }
            
        }
        
    }
    
    
    func declareWinner(winner: Int) {
        
        if winner == 1 {
            crossCount += 1
            crossCounter.text = ("Cross: \(crossCount)")
            print("crosscount: \(crossCount)")
            turnLabel.isHidden = true
            winLabel.isHidden = false
            winLabel.text = "Cross has won"
            playAgainButton.isHidden = false
        } else if winner == 2 {
            circleCount += 1
            circleCounter.text = ("Circle: \(circleCount)")
            turnLabel.isHidden = true
            winLabel.isHidden = false
            winLabel.text = "Circle has won"
            playAgainButton.isHidden = false
        }
        
    }
    
    func declareDraw(isDraw: Bool) {
        
        if isDraw {
            turnLabel.isHidden = true
            winLabel.isHidden = false
            playAgainButton.isHidden = false
            winLabel.text = "Draw"
        }
    }
    
}







