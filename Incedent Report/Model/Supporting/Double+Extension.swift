//
//  Double+Extension.swift
//  Incedent Report
//
//  Created by Matthew Elmore on 10/18/19.
//  Copyright © 2019 Matthew Elmore. All rights reserved.
//

import Foundation


public extension Double {
    //http://www.kylesconverter.com
    var radiansToDegrees: Double        { return self * 180 / Double.pi }
    var degreesToRadians: Double        { return self * Double.pi / 180 }
    var metersToFeet: Double            { return self * 3.2808399 }
    var feetToMeters: Double            { return self * 0.3048 }
    var metersToNauticalMiles: Double   { return self * 0.0005396118248380001 }
    var nauticalMilesToMeters: Double   { return self * 1852 }
    var knotsPHrToNMperMin: Double      { return self/60.0}
    
    func numberOfDecimalPlaces(_ decimalPlaces: Int) -> Double {
        let numberOfDecimalPlaces = String(decimalPlaces)
        let returnDouble = Double("\(String(format: "%.\(numberOfDecimalPlaces)f", self))")
        return returnDouble!
    }
    
    func toStringWithNumberOfDecimal(_ num: Int) -> String {
        return "\(String(format: "%.\(num)f",self))"
    }
    
    func toStringWithZeroDecimal() -> String {
        return "\(String(format: "%.0f",self))"
    }
    
}
