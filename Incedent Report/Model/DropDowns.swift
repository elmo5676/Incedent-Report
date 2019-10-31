//
//  DropDowns.swift
//  Incedent Report
//
//  Created by Matthew Elmore on 10/18/19.
//  Copyright © 2019 Matthew Elmore. All rights reserved.
//

import Foundation


struct DropDowns {
    
    let rank                = [" ", "COL", "LTCOL", "MAJ", "CAPT", "1LT", "2LT", "CMSGT", "SMGT", "MSGT", "TSGT", "SSGT", "SRA", "A1C", "AMN", "AB"]
    
    let heading: [String]   = {
        var headings: [String] = []
        for i in 1...360 {
            headings.append("\(String(i))°")
        }
        return headings
    }()
    
    let unit                = [" ", "1 RS", "99 RS", "99 ERS", "5 RS", "1 ERS"]
    
    let aircraftType        = [" ", "T-38", "U-2", "TU-2"]
    
    let alt                 = [" ", "AGL", "MSL"]
    
    let phaseOfFlight       = [" ", "AIR WORK", "APPROACH", "CLIMB", "CRUISE", "DESCENT", "LANDING", "LOW LEVEL", "PARKING", "PATTERN", "TAKEOFF", "TAXI"]
    
    let lightingConditions  = [" ", "DAWN", "DAY", "DUSK", "NIGHT"]
    
    let visibility          = [" ", "CLEAR", "FOG", "HAZE", "OVERCAST", "SNOW", "RAIN"]
    
    let turbulence          = [" ", "NONE", "LIGHT", "MODERATE", "SEVERE"]
    
    let icingConditions     = [" ", "NONE", "TRACE", "LIGHT", "MODERATE", "SEVERE"]
    
    let birdWatchCondition  = [" ", "LOW", "MODERATE", "SEVERE"]
    
    let numberOfBirds       = [" ", "UNKNOWN", "NONE", "ONE", "2 TO 10", "11 TO 100", "MORE THAN 100"]
    
    let wildlifeSize        = [" ", "UNKNOWN", "SMALL", "MEDIUM", "LARGE"]
    
    let shutDownLoc         = [" ", "PARKING","TAXI WAY","RUNWAY"]
    
//    let shutDownLoc         = [" ", "<#here#>","<#here#>","<#here#>","<#here#>","<#here#>","<#here#>","<#here#>","<#here#>"]
    
    
}
