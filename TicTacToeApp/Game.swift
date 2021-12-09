//
//  GameLogic.swift
//  TicTacToeApp
//
//  Created by Malcolm Lennartsson on 2021-12-02.
//

import Foundation
import UIKit

class Game {
    
    private var stateOfGame = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var isGameActive = true
    
    func changeStateOfGame(place: Int, marker: Int) -> Bool { //checking if place is empty
        //and change state of game to 1 or 2
        
        var success = false
        
        if stateOfGame[place] == 0 && isGameActive == true {
            
            success = true
            
            stateOfGame[place] = marker
            
            print(stateOfGame)
            
        } else {
            
            success = false
            
        }
        return success
    }
    
    func decideWinner() -> Int {
        //checking if combination are equal to eachother, whoIsWinner will be 1 or 2
        
        var whoIsWinner = 0
        
        if stateOfGame[0] == stateOfGame[1] && stateOfGame[0] == stateOfGame[2] && stateOfGame[0] != 0 {
            isGameActive = false
            whoIsWinner = stateOfGame[0]
            
            
        }
        
        if stateOfGame[3] == stateOfGame[4] && stateOfGame[3] == stateOfGame[5] && stateOfGame[3] != 0{
            isGameActive = false
            whoIsWinner = stateOfGame[3]
            
            
        }
        
        if stateOfGame[6] == stateOfGame[7] && stateOfGame[6] == stateOfGame[8] && stateOfGame[6] != 0 {
            isGameActive = false
            whoIsWinner = stateOfGame[6]
            
            
        }
        
        if stateOfGame[0] == stateOfGame[3] && stateOfGame[0] == stateOfGame[6] && stateOfGame[0] != 0 {
            isGameActive = false
            whoIsWinner = stateOfGame[0]
            
            
        }
        
        if stateOfGame[1] == stateOfGame[4] && stateOfGame[1] == stateOfGame[7] && stateOfGame[1] != 0{
            isGameActive = false
            
            whoIsWinner = stateOfGame[1]
            
            
        }
        
        if stateOfGame[2] == stateOfGame[5] && stateOfGame[2] == stateOfGame[8] && stateOfGame[2] != 0 {
            isGameActive = false
            whoIsWinner = stateOfGame[2]
            
            
        }
        
        if stateOfGame[0] == stateOfGame[4] && stateOfGame[0] == stateOfGame[8] && stateOfGame[0] != 0 {
            isGameActive = false
            whoIsWinner = stateOfGame[0]
            
        }
        
        if stateOfGame[2] == stateOfGame[4] && stateOfGame[2] == stateOfGame[6] && stateOfGame[2] != 0 {
            
            isGameActive = false
            
            whoIsWinner = stateOfGame[2]
            
        }
        return whoIsWinner
        
    }
    
    func callDraw() -> Bool { //checking if draw conditions are true or false
        //if every spot in the array is taken by a 1 or a 2
        
        var count = 1
        var isDraw = false
        
        if isGameActive == true{
            
            for i in stateOfGame {
                count = i * count
            }
            if count != 0 {
                isGameActive = false
                isDraw = true
            } else {
                isDraw = false
            }
            
        }
        return isDraw
    }
    
    func resetGame() {
        stateOfGame = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        isGameActive = true
        
    }
    
    
    
    
}
