//
//  ViewController.swift
//  GuessTheWord
//
//  Created by Will Oakley on 10/23/18.
//  Copyright © 2018 Will Oakley. All rights reserved.
//

import UIKit
import SAConfettiView

class ViewController: UIViewController {

    @IBOutlet weak var wordLengthLabel: UILabel!
    @IBOutlet weak var guessField: UITextField!
    @IBOutlet weak var confettiView: SAConfettiView!
    
    let words = ["Hello", "Berkeley", "Oski", "iPhone"]
    let hints = ["How do you do?", "The school we are at", "go berz", "We are making an app for it."]
    
    var successfullyGuessed: [String] = []
    var successfullyGuessedCounts: [Int] = []
    
    var currentWord: String!
    var currentWordIndex: Int!
    var numGuesses: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWord()
    }
    
    func setWord() {
        numGuesses = 0
        currentWordIndex = Int.random(in: 0..<words.count)
        currentWord = words[currentWordIndex]
        print(currentWord)
        wordLengthLabel.text = "My word has " + String(currentWord.count) + " letters."
    }
    
    func guessedCorrect() {
        confettiView.startConfetti()
        successfullyGuessed.append(currentWord)
        successfullyGuessedCounts.append(numGuesses)
        let rightAlert = UIAlertController(title: "Nice!", message: "You got the word in " + String(numGuesses) + " tries!", preferredStyle: UIAlertController.Style.alert)
        rightAlert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { action in
            print("Pressed play again")
            self.confettiView.stopConfetti()
            self.dismiss(animated: true, completion: nil)
            self.setWord()
        }))
        rightAlert.addAction(UIAlertAction(title: "View History", style: .default, handler: { action in
            print("Pressed view history")
            self.dismiss(animated: true, completion: nil)
            self.setWord()
            self.confettiView.stopConfetti()
            self.tappedHistory(self)
        }))
        self.present(rightAlert, animated: true, completion: nil)
    }
    
    func guessedWrong() {
        let wrongAlert = UIAlertController(title: "Uh oh", message: "That word is not right! Try again :(", preferredStyle: UIAlertController.Style.alert)
        wrongAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(wrongAlert, animated: true, completion: nil)
    }
 
    @IBAction func tappedGuess(_ sender: Any) {
        numGuesses = numGuesses + 1
        let word = guessField.text
        if word == currentWord {
            guessedCorrect()
        } else {
            guessedWrong()
        }
    }
    
    @IBAction func tappedHint(_ sender: Any) {
        let wrongAlert = UIAlertController(title: "Hint:", message: hints[currentWordIndex], preferredStyle: UIAlertController.Style.alert)
        wrongAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(wrongAlert, animated: true, completion: nil)
    }
    
    @IBAction func tappedHistory(_ sender: Any) {
        self.performSegue(withIdentifier: "showHistory", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let destination = navController.viewControllers[0] as! HistoryTableViewController
        destination.words = successfullyGuessed
        destination.tries = successfullyGuessedCounts
    }
}

