//
//  Date.swift
//  Weight Matters
//
//  Created by gera on 8/10/17.
//  Copyright © 2017 Gerardo Kilmurray. All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: self)
    }
}
