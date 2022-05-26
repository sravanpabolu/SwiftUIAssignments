//
//  TransactionsListView.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 26/05/22.
//

import SwiftUI

struct TransactionsListView: View {
    @ObservedObject var viewModel = TransactionsListViewModel(client: LocalClient())
    
    var body: some View {
        ZStack {
            Color.chaseBlackShade
                .ignoresSafeArea()
            VStack {
                logoView
                transactionsListView
            }
        }
        .onAppear() {
            getTransactionsList()
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text("Alert"), message: Text(viewModel.networkError?.errorDescription() ?? "Some unknown error"), dismissButton: .cancel())
        }
    }
    
    var logoView: some View {
        Image("chase-bank-logo")
            .aspectRatio(contentMode: .fit)
    }
    
    var transactionsListView: some View {
        List {
            ForEach(viewModel.transactionsList, id: \.id) { aTransaction in
                TransactionRowView(transaction: aTransaction)
            }
        }
        .listStyle(.grouped)
    }
    
    private func getTransactionsList() {
        viewModel.getTransactions()
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView()
    }
}

struct TransactionRowView: View {
    let transaction: TransactionViewModel
    
    var body: some View {
        HStack {
            Text(transaction.description)
                .foregroundColor(Color.gray)
                .fontWeight(.semibold)
            Spacer()
            
            transaction.status == .credit
            ? Text(transaction.amount.formatAsCurrency())
                .foregroundColor(.green)
            : Text(transaction.amount.formatAsCurrency())
                .foregroundColor(.red)
            
            transaction.status == .credit
            ? Image(systemName: "arrow.up")
                .foregroundColor(.green)
//                .frame(width: 5, height: 5, alignment: .center)
            : Image(systemName: "arrow.down")
                .foregroundColor(.red)
//                .frame(width: 5, height: 5, alignment: .center)
        }
        .frame(minHeight: 40, alignment: .center)
    }
}
