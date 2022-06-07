//
//  String.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 08/06/22.
//

import Foundation

extension String {
    var digits: String {
        components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined(separator: " ")
    }
    
    /// Returns a condensed string, with no extra whitespaces and no new lines.
    var condensed: String {
        return replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
    }
    
    var trailingSpacesTrimmed: String {
        var newString = self

        while newString.last?.isWhitespace == true {
            newString = String(newString.dropLast())
        }

        return newString
    }
}
