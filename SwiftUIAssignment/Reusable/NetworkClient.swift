//
//  NetworkClient.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 24/05/22.
//

import Foundation
import Combine

protocol NetworkService {
    func getData<T: Codable>(for endpoint: EndPoint, type: T) throws -> AnyPublisher<T, Error>
}

class APIClient: NetworkService {
    func getData<T: Codable>(for endpoint: EndPoint, type: T) throws -> AnyPublisher<T, Error> {
        
        guard let url = URL(string: endpoint.getUrl()) else {
            throw NetworkError.url
        }
        
        let dataPublisher = URLSession.shared.dataTaskPublisher(for: url)
            .mapError { error in
                NetworkError.custom(description: error.localizedDescription)
            }
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      200...299 ~= response.statusCode else {
                    throw NetworkError.response
                }
                
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main, options: .none)
            .eraseToAnyPublisher()
            
        return dataPublisher
    }
}
