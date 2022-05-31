//
//  Utils.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 30/05/22.
//

import Foundation

class Utils {
    static let shared = Utils()
    private init() { }
    
    func stringToDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        guard let date = dateFormatter.date(from: dateString) else {
            return Date.now
        }
        return date
    }
    
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        return dateFormatter.string(from: date)
    }
}
