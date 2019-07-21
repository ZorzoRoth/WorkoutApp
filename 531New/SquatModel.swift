//
//  SquatModel.swift
//  531New
//
//  Created by Zoltan Puchovsky on 15/07/2019.
//  Copyright © 2019 Zoltan Puchovsky. All rights reserved.
//

import Foundation

class Squat {
    var squatMax: Double
    
    init (squatMax: Double) {
        self.squatMax = squatMax
    }
    
    func weekOne()->Double {
        return (squatMax/100)*65
    }
    
    func weekTwo()->Double {
        return (squatMax/100)*75
    }
    
    func weekThree()->Double {
        return (squatMax/100)*85
    }
    
    func weekFour()->Double {
        return (squatMax/100)*95
    }
    
    
    
}
