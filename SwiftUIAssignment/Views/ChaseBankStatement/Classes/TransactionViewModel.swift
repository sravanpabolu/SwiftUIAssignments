//
//  TransactionViewModel.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 26/05/22.
//

import Foundation

struct TransactionViewModel: Identifiable {
    var id = UUID()
    
    private var transaction: Transaction
    
    init(transaction: Transaction) {
        self.transaction = transaction
    }
    
    var date: String {
        transaction.transactionDate
    }
    
    var status: TransactionType {
        transaction.status
    }
    
    var amount: Double {
        transaction.amount
    }
    
    var description: String {
        transaction.transactionDescription
    }
}
