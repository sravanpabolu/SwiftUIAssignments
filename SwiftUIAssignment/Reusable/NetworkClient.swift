//
//  NetworkClient.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 24/05/22.
//

import Foundation
import Combine

protocol DataFetchService {
    func getData<T: Codable>(for endpoint: EndPoint, type: T.Type) throws -> AnyPublisher<T, Error>
}

class NetworkClient: DataFetchService {
    func getData<T: Codable>(for endpoint: EndPoint, type: T.Type) throws -> AnyPublisher<T, Error> {
        
        guard let url = endpoint.getUrl() else {
            throw DataFetchError.url
        }
        
        let dataPublisher = URLSession.shared.dataTaskPublisher(for: url)
            .mapError { error in
                DataFetchError.custom(description: error.localizedDescription)
            }
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      200...299 ~= response.statusCode else {
                    throw DataFetchError.response
                }
                
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main, options: .none)
            .eraseToAnyPublisher()
            
        return dataPublisher
    }
}
