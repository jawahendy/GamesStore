//
//  GamesModel.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import Foundation

struct CategoryGamesModel: Equatable, Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let voteAverage: Double?
    let voteCount: Int?
}

struct CategoryfavoritModel: Equatable, Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let voteAverage: Double?
    let voteCount: Int?
}

struct AddfavoritModel: Equatable {
    let success: Bool?
    let status_message: String?
    let status_code: Int?
}
