//
//  GetCategoriesRemoteDataSource.swift
//  Category
//
//  Created by Nunu Nugraha on 06/10/25.
//

import Foundation
import Core
import Combine
import Alamofire

public struct GetCategoriesRemoteDataSource: DataSource {
    public typealias Request = Any
    
    public typealias Response = [CategoryResponse]
    
    private let _endpoint: URL
    
    public init(endpoint: URL) {
        _endpoint = endpoint
    }
    
    public func execute(request: Any?) -> AnyPublisher<[CategoryResponse], Error> {
        return Future<[CategoryResponse], Error> { completion in
            AF.request(_endpoint)
                .validate()
                .responseDecodable(of: CategoriesResponse.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value.categories))
                    case .failure(let error):
                        completion(.failure(URLError.invalidResponse))
                    }
                }
        }.eraseToAnyPublisher()
    }
}
