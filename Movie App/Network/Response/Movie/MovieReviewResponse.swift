//
//  MovieReviewResponse.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

// MARK: - MovieReviewResponse
struct MovieReviewResponse: Codable {
    let id, page: Int
    let results: [MovieReview]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MovieReview: Codable {
    let author: String
    let content: String

    enum CodingKeys: String, CodingKey {
        case author
        case content
    }
}
