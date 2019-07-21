//
//  OverheadpressModel.swift
//  531New
//
//  Created by Zoltan Puchovsky on 15/07/2019.
//  Copyright © 2019 Zoltan Puchovsky. All rights reserved.
//

import Foundation

class Overheadpress {
    var overheadpressMax: Double
    
    init (overheadpressMax: Double) {
        self.overheadpressMax = overheadpressMax
    }
    
    func weekOne()->Double {
        return(overheadpressMax/100)*65
    }
    
    func weekTwo()->Double {
        return(overheadpressMax/100)*75
    }
    
    func weekThree()->Double {
        return(overheadpressMax/100)*85
    }
    
    func weekFour()->Double {
        return(overheadpressMax/100)*95
    }
    
    
}
