//
//  Article.swift
//  SwiftUI-Assignment
//
//  Created by Sanket Bhandekar on 28/09/26.
//

import Foundation

struct Article: Identifiable, Codable, Equatable, Hashable {
    let id: String
    var title: String
    var content: String
    var imageName: String
}

// Data is read from a JSON file (Requirement 6)
func getArticles() -> [Article] {
    guard let url = Bundle.main.url(forResource: "articles", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let articles = try? JSONDecoder().decode([Article].self, from: data) else {
        return []
    }
    return articles
}
