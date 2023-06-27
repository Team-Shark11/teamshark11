//
//  Title.swift
//  Cinemax
//
//  Created by Bula on 6/13/23.
//

import Foundation

struct TrendingMoviesResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_language: String?
    let original_title: String?
    let poster_path: String?
    let release_date: String?
    let overview: String?
    let vote_average: Double
    let vote_count: Int
}
