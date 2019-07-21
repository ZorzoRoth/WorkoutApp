//
//  BenchModel.swift
//  531New
//
//  Created by Zoltan Puchovsky on 15/07/2019.
//  Copyright © 2019 Zoltan Puchovsky. All rights reserved.
//

import Foundation

class Benchpress {
    var benchpressMax: Double
    
    init (benchpressMax: Double) {
        self.benchpressMax = benchpressMax
    }
    
    
    func weekOne()->Double {
        return (benchpressMax/100)*65
    }
    
    func weekTwo()->Double {
        return (benchpressMax/100)*75
    }
    
    func weekThree()->Double {
        return (benchpressMax/100)*85
    }
    
    func weekFour()->Double {
        return (benchpressMax/100)*95
    }
    
}
