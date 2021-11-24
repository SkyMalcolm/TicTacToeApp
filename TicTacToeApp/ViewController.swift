//
//  ViewController.swift
//  TicTacToeApp
//
//  Created by Malcolm Lennartsson on 2021-11-23.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //Cross default
    var gameState = [0, 0, 0, 0 , 0, 0, 0, 0, 0, 0]
    
    let gameWon = [[0, 1,2], [3, 4, 5], [6,7, 8], [0, 3, 6], [1, 4, 7], [2, 5 ,8], [0, 4, 8], [2, 4, 6]]
    var isGameActive = true
    

    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBAction func putIconAction(_ sender: AnyObject) {
        if(gameState[sender.tag-1]) == 0 && isGameActive == true {
            gameState[sender.tag-1] = activePlayer
            if(activePlayer == 1) {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State.normal)
                activePlayer = 2
            }else{
                sender.setImage(UIImage(named: "Circle.png"), for: UIControl.State.normal)
                activePlayer = 1
            }
        }
        
        for winningCombination in gameWon {
            if gameState[winningCombination[0]] != 0 && gameState[winningCombination[0]] == gameState[winningCombination[1]] && gameState[winningCombination[1]] == gameState[winningCombination[2]] {
                
                isGameActive = false
                
                if gameState [winningCombination[0]] == 1 {
                    //Cross has won
                    winLabel.text = "Cross has won"
                }else{
                    //Circle has won
                    winLabel.text = "Circle has won"
                }
                
                playAgainButton.isHidden = false
                winLabel.isHidden = false
                
            }
            
        }
        var count = 1
                
        if isGameActive == true{
            for i in gameState{
                count = i*count
            }
            if count != 0 {
                winLabel.text = "Draw"
                winLabel.isHidden = false
                playAgainButton.isHidden = false
                    }
                }
            
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject) {
        
        gameState = [0, 0, 0, 0 , 0, 0, 0, 0, 0, 0]
        isGameActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        winLabel.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State.normal)
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        }
    
    }

