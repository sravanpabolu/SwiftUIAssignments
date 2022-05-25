//
//  Enums.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 24/05/22.
//

import Foundation

enum EndPoint {
    case topSongs
    
    func getUrl() -> String {
        return Constants.URLConstants.url_top_songs
    }
}

enum NetworkError: Error {
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
