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
    
    static func offsetFrom(fromDate: Date, toDate: Date) -> String {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.day, .month, .year]
        dateComponentsFormatter.unitsStyle = .full

        return dateComponentsFormatter.string(from: fromDate, to: toDate) ?? ""
    }
    
    static func calculateInterest(for amount: Double, with interestRate: Double, fromDate: Date, toDate: Date) -> Double {
        let duration = Utils.offsetFrom(fromDate: fromDate, toDate: toDate)
        let shortDuration = duration.digits.condensed.trailingSpacesTrimmed
        
        let durationArr = Array(shortDuration.components(separatedBy: " ").reversed())

        let days    = durationArr.count > 0 ? Double(durationArr[0]) : 0.0
        let months  = durationArr.count > 1 ? Double(durationArr[1]) : 0.0
        let years   = durationArr.count > 2 ? Double(durationArr[2]) : 0.0
        
        let interestYears = Double((amount * Double(years ?? 0) * interestRate) / 100)
        let interestMonths = Double((amount * Double(months ?? 0) * interestRate) / (100 * 12))
        let interestDays = Double((amount * Double(days ?? 0) * interestRate) / (100 * 12 * 30))
        
        return interestYears + interestMonths + interestDays
    }
}

