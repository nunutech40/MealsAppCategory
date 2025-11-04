//
//  CategoriesResponse.swift
//  Category
//
//  Created by Nunu Nugraha on 06/10/25.
//

import Foundation

public struct CategoriesResponse: Decodable, Sendable {
    
    let categories: [CategoryResponse]
    
}

public struct CategoryResponse: Decodable, Sendable {
    
    private enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case title = "strCategory"
        case image = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
    
    let id: String?
    let title: String?
    let image: String?
    let description: String?
    
}
