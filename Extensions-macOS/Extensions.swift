//
//  Extensions.swift
//  ARKExtensions
//
//  Created by ark dan on 10/4/16.
//  Copyright © 2016 arkdan. All rights reserved.
//

import Foundation


public func onMain(_ closure: @escaping () -> Void) {
    if Thread.isMainThread {
        closure()
    } else {
        DispatchQueue.main.async {
            closure()
        }
    }
}

extension Double {
    public func round(_ digits: UInt) -> Double {
        let divisor = pow(10.0, Double(digits))
        return Darwin.round(self * divisor) / divisor
    }
}

extension Int {
    public func random() -> Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}


public func address(of object: AnyObject) -> String {
    return "0x" + String(unsafeBitCast(object, to: Int.self), radix: 16)
}
