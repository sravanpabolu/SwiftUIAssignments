//
//  InterestCalculator.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 06/06/22.
//

import SwiftUI

struct InterestCalculator: View {
    @State var fromDate: Date = Date.now
    @State var toDate: Date = Date.now
    @State var amount: String = ""
    @State var interestRate: String = ""
    @State var duration: String = ""
    @State var interest: Double = 0.0
    @State var totalAmount: Double = 0.0
    
    var body: some View {
        VStack() {
            Text("Interest Calculator")
                .font(.title)
            
            Group {
                fromDateView
                toDateView
                amountField
                interestField
                submitBtn
            }
            
            Divider()
                .background(.gray)
            
            resultsView
            Spacer()
        }
        .padding()
    }
    
    var fromDateView: some View {
        DatePicker("From",
                   selection: $fromDate,
                   displayedComponents: [.date])
    }
    
    var toDateView: some View {
        DatePicker("To",
                   selection: $toDate,
                   displayedComponents: [.date])
    }
    
    var amountField: some View {
        HStack() {
            Text("Amount")
            Spacer()
            TextField("Amount", text: $amount)
                .frame(width: 130, alignment: .trailing)
                .textFieldStyle(.roundedBorder)
                .border(.gray)
                .multilineTextAlignment(.trailing)
        }
    }
    
    var interestField: some View {
        HStack {
            Text("Interest Rate")
            Spacer()
            TextField("Interest", text: $interestRate)
                .frame(width: 130, alignment: .trailing)
                .textFieldStyle(.roundedBorder)
                .border(.gray)
                .multilineTextAlignment(.trailing)
        }
    }
    
    var submitBtn: some View {
        Button("Calculate") {
            interest = calculateInterest()
            totalAmount = interest + (Double(amount) ?? 0.0)
        }
    }
    
    var resultsView: some View {
        VStack(alignment: .leading) {
            Text("Results")
                .font(.title2)
                .frame(alignment: .leading)
            
            HStack {
                Text("Duration")
                Spacer()
                Text("\(duration)")
            }
            
            HStack {
                Text("Interest")
                Spacer()
                Text("\(interest)")
            }
            
            HStack {
                Text("Total")
                Spacer()
                Text("\(totalAmount)")
            }
        }
        .padding()
    }
    
    func calculateInterest() -> Double {
        let principal = Double(amount) ?? 0.0
        let rate = Double(interestRate) ?? 0.0
        return Utils.calculateInterest(for: principal, with: rate, fromDate: fromDate, toDate: toDate)
    }
}

struct InterestCalculator_Previews: PreviewProvider {
    static var previews: some View {
        InterestCalculator(
            fromDate: Date.from(year: 2021, month: 12, day: 30),
            toDate: Date.now,
            amount: "100.0",
            interestRate: "12"
        )
    }
}
