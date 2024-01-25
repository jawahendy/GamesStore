//
//  APICall.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import Foundation

struct API {
  static let baseUrl = "https://api.themoviedb.org"
}

protocol Endpoint {

  var url: String { get }

}

enum Endpoints {

  enum Gets: Endpoint {
    case gameList
    case favoitlist
    case addfavorit

    public var url: String {
      switch self {
      case .gameList: return "\(API.baseUrl)/3/movie/popular"
      case .favoitlist: return "\(API.baseUrl)/3/account/12232149/favorite/movies"
      case .addfavorit: return "\(API.baseUrl)/3/account/12232149/favorite"
      }
    }
  }

}
