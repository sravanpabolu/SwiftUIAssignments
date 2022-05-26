//
//  Enums.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 24/05/22.
//

import Foundation

enum EndPoint {
    case topSongs
    case chaseBankStatement
    
    func getUrl() -> URL? {
        switch self {
        case .topSongs:
            return URL(string: Constants.URLConstants.url_top_songs)
        case .chaseBankStatement:
            return Bundle.main.url(forResource: "ChaseBankStatementResponse", withExtension: "json")
        }
    }
}

enum DataFetchError: Error {
    case url, response, parsing
    case custom(description: String)
    
    func errorDescription() -> String {
        switch self {
        case .url:
            return "URL Error"
        case .response:
            return "Response Error"
        case .parsing:
            return "Parsing Error"
        case .custom(description: let description):
            return description
        }
    }
}
