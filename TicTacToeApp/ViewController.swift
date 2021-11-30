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
    
    var whoIsPlaying = 1 //default starter
    var stateOfGame = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var isGameActive = true
    
    let combinationOfWin = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7],
                            [2, 5, 8], [0, 4, 8], [2, 4 ,6]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func putCrossOrCircle(_ sender: UIButton) {
        
        
        if (stateOfGame[sender.tag-1] == 0 && isGameActive == true) {
            
            stateOfGame[sender.tag-1] = whoIsPlaying
            
            if (whoIsPlaying == 1) {
                sender.setImage(UIImage(named: "Cross.png"), for: .normal)
                whoIsPlaying = 2
                
            } else {
                
                sender.setImage(UIImage(named: "Circle.png"), for: .normal)
                whoIsPlaying = 1
                
            }
            
            
        }
        print("\(stateOfGame)")
        
        whoIsWinner()
        callDraw()
        
        
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        stateOfGame = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        isGameActive = true
        whoIsPlaying = 1
        
        playAgainButton.isHidden = true
        winLabel.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as? UIButton
            button?.setImage(UIImage(named: "emptyImage.png"), for: .normal)
            }
    
        
        
    }
    
    
    func declareWinner(winner: Int) {
        
        var crossCount = 0
        var circleCount = 0
        
        if winner == 1 {
            isGameActive = false
            crossCount += 1
            crossCounter.text = ("Cross: \(crossCount)")
            winLabel.isHidden = false
            winLabel.text = "Cross has won"
            playAgainButton.isHidden = false
        } else {
            isGameActive = false
            circleCount += 1
            circleCounter.text = ("Circle: \(circleCount)")
            winLabel.isHidden = false
            winLabel.text = "Circle has won"
            playAgainButton.isHidden = false
        }
    
    }
    
    func callDraw() {
        var count = 1
    
        
        if isGameActive == true{
            
            for i in stateOfGame {
                 count = i * count
            }
            if count != 0 {
                isGameActive = false
                winLabel.isHidden = false
                winLabel.text = "Draw"
            }
                   
               }
        
    }
    
    func whoIsWinner() {
        
        if stateOfGame[0] == stateOfGame[1] && stateOfGame[0] == stateOfGame[2] && stateOfGame[0] != 0 {
            declareWinner(winner: stateOfGame[0])
            
        }
        
        if stateOfGame[3] == stateOfGame[4] && stateOfGame[3] == stateOfGame[5] && stateOfGame[3] != 0{
            
            declareWinner(winner: stateOfGame[3])
            
        }
        
        if stateOfGame[6] == stateOfGame[7] && stateOfGame[6] == stateOfGame[8] && stateOfGame[6] != 0 {
            
            declareWinner(winner: stateOfGame[6])
            
        }
        
        if stateOfGame[0] == stateOfGame[3] && stateOfGame[0] == stateOfGame[6] && stateOfGame[0] != 0 {
            
            declareWinner(winner: stateOfGame[0])
            
        }
        
        if stateOfGame[1] == stateOfGame[4] && stateOfGame[1] == stateOfGame[7] && stateOfGame[1] != 0{
            
            declareWinner(winner: stateOfGame[1])
        }
        
        if stateOfGame[2] == stateOfGame[5] && stateOfGame[2] == stateOfGame[8] && stateOfGame[2] != 0 {
            
            declareWinner(winner: stateOfGame[2])
        }
        
        if stateOfGame[0] == stateOfGame[4] && stateOfGame[0] == stateOfGame[8] && stateOfGame[0] != 0 {
            
            declareWinner(winner: stateOfGame[0])
        }
        
        if stateOfGame[2] == stateOfGame[4] && stateOfGame[2] == stateOfGame[6] && stateOfGame[2] != 0 {
            
            declareWinner(winner: stateOfGame[2])
        }
        
        
        }
    
    }







