//
//  GamesResponse.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import Foundation


struct CategoriesGamesResponse: Decodable {

  let results: [CategoryGamesResponse]

}

struct CategoriesFavortResponse: Decodable {

  let results: [CategoryFavortResponse]

}

struct AddFavortResponse: Decodable {

  let results: [AddsFavortResponse]

}

struct CategoryGamesResponse: Decodable {
    let adult: Bool?
    let backdrop_path: String?
    let id: Int?
    let originalLanguage: String?
    let original_title, overview: String?
    let popularity: Double?
    let poster_path, release_date, title: String?
    let vote_average: Double?
    let vote_count: Int?
}


struct CategoryFavortResponse: Decodable {
    let adult: Bool?
    let backdrop_path: String?
    let id: Int?
    let originalLanguage: String?
    let original_title, overview: String?
    let popularity: Double?
    let poster_path, release_date, title: String?
    let vote_average: Double?
    let vote_count: Int?
}

struct AddsFavortResponse: Decodable {
    let success: Bool?
    let status_message: String?
    let status_code: Int?
}
