//
//  Double.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 26/05/22.
//

import Foundation

extension Double {
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "" 
    }
}
