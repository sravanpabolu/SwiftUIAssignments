//
//  Transaction.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 26/05/22.
//

import Foundation

enum TransactionType: Codable {
    case credit, debit
}

struct Transactions: Codable {
    let transactions: [Transaction]
}

// MARK: - Transaction
struct Transaction: Codable {
    let transactionDescription: String
    let transactionDate: Date
    let amount: Double
    let status: TransactionType

    enum CodingKeys: String, CodingKey {
        case transactionDescription = "description"
        case amount, status
        case transactionDate = "transaction_date"
    }
}

extension Transaction {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.transactionDescription = try container.decode(String.self, forKey: .transactionDescription)
        
        let date = try container.decode(String.self, forKey: .transactionDate)
        self.transactionDate = Utils.shared.stringToDate(dateString: date)
        
        let statusType = try container.decode(String.self, forKey: .status)
        self.status = (statusType == "credit") ? .credit : .debit
        
        let stringAmount = try container.decode(String.self, forKey: .amount)
        self.amount = Double(stringAmount) ?? 0.0
    }
}
