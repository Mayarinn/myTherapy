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
        
        SavedMinds.answeredMind = AnswerMindClass.init(name: "first")
        print(SavedMinds.answeredMind.hour, ":",
              SavedMinds.answeredMind.minute, ":",
              SavedMinds.answeredMind.second, SavedMinds.answeredMind.name
        )
    }


}

