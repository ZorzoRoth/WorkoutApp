//
//  DeadliftModel.swift
//  531New
//
//  Created by Zoltan Puchovsky on 14/07/2019.
//  Copyright © 2019 Zoltan Puchovsky. All rights reserved.
//

import Foundation

class Deadlift {
    var deadliftMax:Double
    
    init (deadliftMax: Double) {
        self.deadliftMax = deadliftMax
    }
    
    
    
    
    func weekOne()->Double {
        return (deadliftMax/100)*65
    }
    
    func weekTwo()->Double {
        return (deadliftMax/100)*75
    }
    
    func weekThree()->Double {
        return (deadliftMax/100)*85
    }
    
    func weekFour()->Double {
        return (deadliftMax/100)*95
    }
    
    
    
    
}
