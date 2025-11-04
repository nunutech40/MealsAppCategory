//
//  GetCategoryLocaleDataSource.swift
//  Category
//
//  Created by Nunu Nugraha on 06/10/25.
//

import Core
import Combine
import RealmSwift
import Foundation

public class GetCategoriesLocaleDataSource: LocaleDataSource {
    
    public typealias Request = Any
    public typealias Response = CategoryModuleEntity
    
    private let _realm: Realm
    
    public init(realm: Realm) {
        self._realm = realm
    }
    
    public func list(request: Any?) -> AnyPublisher<[CategoryModuleEntity], Error> {
        return Future<[CategoryModuleEntity], Error> { completion in
            let categories: Results<CategoryModuleEntity> = {
                self._realm.objects(CategoryModuleEntity.self)
                    .sorted(byKeyPath: "title", ascending: true)
            }()
            completion(.success(categories.toArray(ofType: CategoryModuleEntity.self)))
        }.eraseToAnyPublisher()
    }
    
    public func add(entities: [CategoryModuleEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            do {
                try self._realm.write {
                    for category in entities {
                        self._realm.add(category, update: .all)
                    }
                    completion(.success(true))
                }
            } catch {
                completion(.failure(DatabaseError.requestFailed))
            }
        }.eraseToAnyPublisher()
    }
    
    public func get(id: String) -> AnyPublisher<CategoryModuleEntity, any Error> {
        fatalError()
    }
    
    public func update(id: String, entity: CategoryModuleEntity) -> AnyPublisher<CategoryModuleEntity, Error> {
        fatalError()
    }
}
