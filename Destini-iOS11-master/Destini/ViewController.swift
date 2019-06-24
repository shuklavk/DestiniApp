//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Completed and redone/revamped by Vikas Shukla on 06/23/2019
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Our stories
    
    var storyOne = Story(story: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\".", answer1: "I\'ll hop in. Thanks for the help!", answer2: "Better ask him if he\'s a murderer first.")
    
    var storyTwo = Story(story: "He nods slowly, unphased by the question.", answer1: "At least he\'s honest. I\'ll climb in.", answer2: "Wait, I know how to change a tire.")
    
    var storyThree = Story(story: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.", answer1: "I love Elton John! Hand him the cassette tape.", answer2: "It\'s him or me! You take the knife and stab him.")
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    
    var depth: Int = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyOneScreen()
        
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        if depth == 0{
            if sender.tag == 1{
                storyThreeScreen()
            }else if sender.tag == 2{
                storyTwoScreen()
            }
            depth += 1
            
        }
        else if depth == 1 && storyTextView.text == storyTwo.story{
            if sender.tag == 1{
                storyThreeScreen()
            }else if sender.tag == 2{
                storyTextView.text = story4
            }
            depth += 1
        }else if depth == 1 && storyTextView.text == storyThree.story{
            if(sender.tag == 1 ){
                storyTextView.text = story6
            }else if (sender.tag == 2){
                storyTextView.text = story5
            }
            depth += 1
        }else if depth == 2 && storyTextView.text == storyThree.story{
            if sender.tag == 1{
                storyTextView.text = story6
            }else if sender.tag == 2{
                storyTextView.text = story5
            }
            depth += 1
        }else{
            showRestartAlert()
            depth = 0
        }
    
    }
    
    //Operations to do if story restarted
    func startOver(){
        storyTextView.text = storyOne.story
        topButton.setTitle(storyOne.answer1, for: .normal)
        bottomButton.setTitle(storyOne.answer2, for: .normal)
    }
    
    //Set up the UI with story 1 + Options
    func storyOneScreen(){
        storyTextView.text = storyOne.story;
        topButton.setTitle(storyOne.answer1, for: .normal)
        bottomButton.setTitle(storyOne.answer2, for: .normal)
    }
    
    //Set up the UI with story 2 + Options
    func storyTwoScreen(){
        storyTextView.text = storyTwo.story;
        topButton.setTitle(storyTwo.answer1, for: .normal)
        bottomButton.setTitle(storyTwo.answer2, for: .normal)
    }
    
    //Set up the UI with story 3 + Options
    func storyThreeScreen(){
        storyTextView.text = storyThree.story;
        topButton.setTitle(storyThree.answer1, for: .normal)
        bottomButton.setTitle(storyThree.answer2, for: .normal)
    }
    
    
    //Alert that prompts user if they want to restart the story
    func showRestartAlert(){
        let alert = UIAlertController(title: "The End", message: "Your story has ended, do you want to start over? ", preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
            self.startOver()
        }
        
        alert.addAction(restartAction)
        
        present(alert, animated: true, completion: nil)
    }



}

