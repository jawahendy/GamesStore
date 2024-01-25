//
//  RemoteDataSource.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import Foundation
import Alamofire
import Combine

protocol RemoteDataSourceProtocol: AnyObject {
  func getCategories() -> AnyPublisher<[CategoryGamesResponse], Error>
  func getCategoriesFavorite() -> AnyPublisher<[CategoryFavortResponse], Error>
  func addCategoriesFavorite(id:Int, fav: Bool) -> AnyPublisher<[AddsFavortResponse], Error>
}

final class RemoteDataSource: NSObject {

  private override init() { }

  static let sharedInstance: RemoteDataSource =  RemoteDataSource()

}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    func addCategoriesFavorite(id:Int, fav: Bool) -> AnyPublisher<[AddsFavortResponse], Error> {
        return Future<[AddsFavortResponse], Error> { completion in
          if let url = URL(string: Endpoints.Gets.addfavorit.url) {
              let parameters = [
                  "media_type": "movie",
                  "media_id": id,
                  "favorite": fav
              ]
              print(parameters)
              AF.request(url,method: .post,parameters: parameters,encoding: JSONEncoding.default,headers: ["Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjdhYTZjYWJmMzg4ODM5NmEyZTVjN2JjZDEzYTRjYyIsInN1YiI6IjYyNTZjNTJjMGMyNzEwMDIyOTVkOTgyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Zv3FvPx_J7__Mt2wyFZC4dXZ8NwW94dyO2F-TlqZHaA",
                                     "Content-Type": "application/json"])
              .responseJSON { response in
                  print(response)
              }
          }
        }.eraseToAnyPublisher()
      }
    
    
    
  func getCategories() -> AnyPublisher<[CategoryGamesResponse], Error> {
    return Future<[CategoryGamesResponse], Error> { completion in
      if let url = URL(string: Endpoints.Gets.gameList.url) {
        AF.request(url,headers: ["Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjdhYTZjYWJmMzg4ODM5NmEyZTVjN2JjZDEzYTRjYyIsInN1YiI6IjYyNTZjNTJjMGMyNzEwMDIyOTVkOTgyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Zv3FvPx_J7__Mt2wyFZC4dXZ8NwW94dyO2F-TlqZHaA",
                                 "Content-Type": "application/json"])
          .validate()
          .responseDecodable(of: CategoriesGamesResponse.self) { response in
            switch response.result {
            case .success(let value):
              completion(.success(value.results))
            case .failure:
              completion(.failure(URLError.invalidResponse))
            }
          }
      }
    }.eraseToAnyPublisher()
  }
    
    func getCategoriesFavorite() -> AnyPublisher<[CategoryFavortResponse], Error> {
      return Future<[CategoryFavortResponse], Error> { completion in
        if let url = URL(string: Endpoints.Gets.favoitlist.url) {
          AF.request(url,headers: ["Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjdhYTZjYWJmMzg4ODM5NmEyZTVjN2JjZDEzYTRjYyIsInN1YiI6IjYyNTZjNTJjMGMyNzEwMDIyOTVkOTgyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Zv3FvPx_J7__Mt2wyFZC4dXZ8NwW94dyO2F-TlqZHaA",
                                   "Content-Type": "application/json"])
            .validate()
            .responseDecodable(of: CategoriesFavortResponse.self) { response in
              switch response.result {
              case .success(let value):
                completion(.success(value.results))
              case .failure:
                completion(.failure(URLError.invalidResponse))
              }
            }
        }
      }.eraseToAnyPublisher()
    }
    

}
