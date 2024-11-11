//
//  AnswerMindClass.swift
//  myTherapy
//
//  Created by Karina Osadchaya on 11/1/24.
//

import UIKit

class AnswerMindClass: NSObject, NSCoding {
    let name: String
    
    let hour: Int
    let minute: Int
    let second: Int
    
    init?(name: String) {
        self.name = name
        
        //date
        let currentDate = Date()
        let calendar = Calendar.current
        
        self.hour = calendar.component(.hour, from: currentDate)
        self.minute = calendar.component(.minute, from: currentDate)
        self.second = calendar.component(.second, from: currentDate)
        print("from init \(self.second)")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? "mind name"
        
        hour = coder.decodeInteger(forKey: "hour")
        minute = coder.decodeInteger(forKey: "minute")
        second = coder.decodeInteger(forKey: "second")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(hour, forKey: "hour")
        coder.encode(minute, forKey: "minute")
        coder.encode(second, forKey: "second")
    }
    
}
