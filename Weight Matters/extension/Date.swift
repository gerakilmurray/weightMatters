//
//  Date.swift
//  Weight Matters
//
//  Created by gera on 8/10/17.
//  Copyright © 2017 Gerardo Kilmurray. All rights reserved.
//

import Foundation

extension Date {
    static let formatDateString = "MM/dd/yyyy"
    static let formatTimeString = "hh:mm:ss"
    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Date.formatDateString
        return dateFormatter.string(from: self)
    }
    
    func toStringTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Date.formatTimeString
        return dateFormatter.string(from: self)
    }
}
