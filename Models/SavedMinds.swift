//
//  SavedMinds.swift
//  myTherapy
//
//  Created by Karina Osadchaya on 11/1/24.
//

import UIKit

final class SavedMinds {
    
    static var answeredMind: AnswerMindClass! {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: "answeredMind") as? Data, let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? AnswerMindClass else { return nil }
            return decodedModel
                    
        } set {
            
            let defaults = UserDefaults.standard
            
            if let answeredMind = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: answeredMind, requiringSecureCoding: false) {
                    defaults.set(savedData, forKey: "answeredMind")
                }
            }
        }
    }
    
}
