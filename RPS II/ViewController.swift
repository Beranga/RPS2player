//
//  ViewController.swift
//  RPS II
//
//  Created by Cesareo on 22/05/20.
//  Copyright © 2020 Cesareo. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UpdateUI(state: .start)
            }

            
            @IBOutlet weak var appSign: UILabel!
            @IBOutlet weak var status: UILabel!
            @IBOutlet weak var fist: UIButton!
            @IBOutlet weak var hand: UIButton!
            @IBOutlet weak var twoFingers: UIButton!
            @IBOutlet weak var playAgain: UIButton!
            @IBOutlet weak var jugador1Label: UILabel!
            @IBOutlet weak var jugador2Label: UILabel!
            @IBOutlet weak var score1Label: UILabel!
            @IBOutlet weak var score2Label: UILabel!
            @IBOutlet weak var reiniciar: UIButton!
    
            @IBAction func fistAction(_ sender: UIButton) {
                play(playerPressed: .rock)
            }
            @IBAction func handAction(_ sender: UIButton) {
                play(playerPressed: .paper)
            }
            @IBAction func twoFingersAction(_ sender: UIButton) {
                play(playerPressed: .sissors)
            }
            @IBAction func playAgainAction(_ sender: UIButton) {
                UpdateUI(state: .start)
            }
            @IBAction func reiniciarAction(_ sender: Any) {
                score1 = 0
                score2 = 0
                UpdateUI(state: .start)
            }
    
            let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
            var score1 = 0
            var score2 = 0
    
            func randomSign() -> Sign {
                let sign = randomChoice.nextInt()
                if sign == 0 {
                    return .rock
                } else if sign == 1 {
                    return .paper
                } else  {
                    return .sissors
                }
            }

            
            func UpdateUI(state: GameState) {
                     switch state {
                     case GameState.start:
                         self.view.backgroundColor = UIColor.white
                         appSign.text = "🤖"
                         status.text = "¡Sin... cham... pú!"
                         playAgain.isHidden = true
                         playAgain.tintColor = .systemBlue
                         fist.isHidden = false
                         fist.isEnabled = true
                         hand.isHidden = false
                         hand.isEnabled = true
                         reiniciar.isHidden = false
                         reiniciar.isEnabled = true
                         twoFingers.isHidden = false
                         twoFingers.isEnabled = true
                         score1Label.text = String(score1)
                         score2Label.text = String(score2)
                        
                        
                     case GameState.win:
                         self.view.backgroundColor = UIColor.green
                         score1 += 1
                         score1Label.text = String(score1)
                         score2Label.text = String(score2)
                         playAgain.tintColor = .white
                     case GameState.lose:
                         self.view.backgroundColor = UIColor.red
                         score2 += 1
                         score1Label.text = String(score1)
                         score2Label.text = String(score2)
                         playAgain.tintColor = .white
                     case GameState.draw:
                         self.view.backgroundColor = UIColor.gray
                             playAgain.tintColor = .white
                     }
                }
                
            
          
            func play(playerPressed: Sign) {
                let random = randomSign()
                let theWinner: GameState = Winner(playerTurn: playerPressed , computerTurn: random)
                let result = GameState.UIstate(theWinner)
                UpdateUI(state: theWinner )
                appSign.text = Sign.emoji(random)()
                status.text = result()
                twoFingers.isEnabled = false
                fist.isEnabled = false
                hand.isEnabled = false
                reiniciar.isHidden = true
                reiniciar.isEnabled = false
                
                if playerPressed != .rock {
                    fist.isHidden = true
                }
                if playerPressed != .paper {
                    hand.isHidden = true
                }
                if playerPressed != .sissors {
                    twoFingers.isHidden = true
                }
                playAgain.isHidden = false
                playAgain.isEnabled = true
                }
                
            
              
        }




