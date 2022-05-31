//
//  ChaseBankViewModel.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 26/05/22.
//

import Foundation
import Combine

class TransactionsListViewModel: ObservableObject {
    
    let client: DataFetchService
    private var cancellable = Set<AnyCancellable>()
    
    @Published var isLoading = false
    @Published var hasError = false
    @Published var groupedTransactions = [Date: [TransactionViewModel]]()
    
    private(set) var networkError: DataFetchError?
    
    init(client: DataFetchService) {
        self.client = client
    }
    
    func getTransactions() {
        do {
            try client.getData(for: .chaseBankStatement, type: Transactions.self)
                .sink(receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    switch completion {
                    case .failure(let error):
                        self?.hasError = true
                        self?.networkError = DataFetchError.custom(description: error.localizedDescription)
                    case .finished:
                        print("Finished")
                    }
                }, receiveValue: { [weak self] allTransactions in
                    self?.hasError = false
                    self?.groupedTransactions = self?.getTransactionsListGroupedByDate(transactions: allTransactions.transactions) ?? [:]
                })
                .store(in: &cancellable)
            
        } catch let error as DataFetchError {
            isLoading = false
            hasError = true
            networkError = DataFetchError.custom(description: error.localizedDescription)
        } catch {
            isLoading = false
            hasError = true
            networkError = DataFetchError.custom(description: error.localizedDescription)
        }
    }
    
    func getTransactionsListGroupedByDate(transactions: [Transaction]) -> [Date: [TransactionViewModel]] {
        let datesArray = transactions.map {
            $0.transactionDate
        }
        
        var groupedTransactions = [Date: [TransactionViewModel]]()
        datesArray.forEach {
            let dateKey: Date = $0
            let filterArray = transactions.filter {
                $0.transactionDate == dateKey
            }
            let transactionVMArray = filterArray.map({
                TransactionViewModel(transaction: $0)
            })
            groupedTransactions[dateKey] = transactionVMArray
        }
        return groupedTransactions
    }
}
