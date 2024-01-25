//
//  GamesMapper.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import Foundation

final class GamesMapper {

  static func mapCategoryResponsesToDomains(
    input categoryResponses: [CategoryGamesResponse]
  ) -> [CategoryGamesModel] {

    return categoryResponses.map { result in
        return CategoryGamesModel(
            adult: result.adult!,
            backdropPath: result.backdrop_path ?? "",
            id: result.id!,
            originalLanguage: result.originalLanguage ?? "",
            originalTitle: result.original_title ?? "",
            overview: result.overview ?? "",
            popularity: result.popularity!,
            posterPath: result.poster_path ?? "",
            releaseDate: result.release_date ?? "",
            title: result.title ?? "",
            voteAverage: result.vote_average ?? 0,
            voteCount: result.vote_count ?? 0
        )
    }
  }
    
    
static func mapCategoryResponsesToDomainsFavorit(
      input categoryResponsesfav: [CategoryFavortResponse]
    ) -> [CategoryfavoritModel] {

      return categoryResponsesfav.map { result in
          return CategoryfavoritModel(
              adult: result.adult!,
              backdropPath: result.backdrop_path ?? "",
              id: result.id!,
              originalLanguage: result.originalLanguage ?? "",
              originalTitle: result.original_title ?? "",
              overview: result.overview ?? "",
              popularity: result.popularity!,
              posterPath: result.poster_path ?? "",
              releaseDate: result.release_date ?? "",
              title: result.title ?? "",
              voteAverage: result.vote_average ?? 0,
              voteCount: result.vote_count ?? 0
          )
      }
    }
    
    static func mapCategoryResponsesToDomainsFavoritAdd(
          input categoryResponsesfav: [AddsFavortResponse]
        ) -> [AddfavoritModel] {

          return categoryResponsesfav.map { result in
              return AddfavoritModel(
                  success: result.success,
                  status_message: result.status_message ?? "",
                  status_code: result.status_code!
              )
          }
        }

}
