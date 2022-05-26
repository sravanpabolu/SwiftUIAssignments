//
//  LocalClient.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 26/05/22.
//

import Foundation
import Combine

struct LocalClient: DataFetchService {
    func getData<T>(for endpoint: EndPoint, type: T.Type) throws -> AnyPublisher<T, Error> where T : Decodable, T : Encodable {
     
        print("Printing from local json")
        
        guard let url = endpoint.getUrl() else {
            throw DataFetchError.url
        }
        
        let aPublisher = Future<T, Error> { promise in
            do {
                let data = try Data(contentsOf: url)
                let parsedData = try JSONDecoder().decode(T.self, from: data)
                return promise(.success(parsedData))
            } catch {
                return promise(.failure(DataFetchError.parsing))
            }
        }
        
        return aPublisher.eraseToAnyPublisher()
    }
}
