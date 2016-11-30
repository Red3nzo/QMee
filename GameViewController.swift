//
//  GameViewController.swift
//  QMee
//
//  Created by Brandon Jacobi on 10/23/16.
//  Copyright © 2016 pulseonestudios. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    
    //Gets Data from array to be accessed in GameViewController
    var game: QMeeGame = QMeeGame()
    var point = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pointLabel.text = "--"
        
        let starterImage = UIImage(named: "2")
        questionImageView.image = starterImage
        questionLabel.text = "Tap the true button to start a new game!"
        falseButton.isEnabled = false
    }
    
    @IBAction func trueButtonPressed(_ sender: AnyObject) {
        print("True Tapped")
        
        if pointLabel.text == "--" {
            game.point = 0
            falseButton.isEnabled = true
        } else {
         game.point += 1
        }
        updateGameInfo()
    }
    
    @IBAction func falseButtonPressed(_ sender: AnyObject) {
        print("false Tapped")
        game.point -= 1
        updateGameInfo()
    }
    
    func updateGameInfo() {
        let nextQuestion = game.getNextQuestion()
        let questionImage = game.getQuestionImageName()
        let image = UIImage(named: questionImage)
        
        questionImageView.image = image
        questionLabel.text = nextQuestion
        pointLabel.text = "\(game.point)"
    }

}
