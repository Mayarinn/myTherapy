//
//  ViewController.swift
//  myTherapy
//
//  Created by Karina Osadchaya on 11/1/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SavedMindsOLD.answeredMind = AnswerMindClass.init(name: "first")
        print(SavedMindsOLD.answeredMind.hour, ":",
              SavedMindsOLD.answeredMind.minute, ":",
              SavedMindsOLD.answeredMind.second, SavedMindsOLD.answeredMind.name
        )
    }


}

