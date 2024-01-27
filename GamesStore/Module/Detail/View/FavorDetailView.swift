//
//  FavorDetailView.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 22/01/24.
//

import SwiftUI
import CoreData
import Favorite
import Core

struct FavorDetailView: View {
//  @ObservedObject var presenter: FavoriteDetailPresenter
    @ObservedObject var presenter: GetListFavoritePresenter<Any, CategoryfavoritsModels, InteractorFavorite<Any, [CategoryfavoritsModels], GetCategoriesFavorRepository<GetCategoriesFavRemoteDataSource, CategoryTransformerFavorite>>>
    
    var category: CategoryfavoritsModels

  var body: some View {
    ZStack {
      if presenter.isLoading {
        loadingIndicator
      } else {
        ScrollView(.vertical) {
          VStack {
            imageCategory
            spacer
            content
            spacer
          }.padding()
        }
      }
    }
  }
}

extension FavorDetailView {
  var spacer: some View {
    Spacer()
  }

  var loadingIndicator: some View {
    VStack {
      Text("Loading...")
      ProgressView()
    }
  }

  var imageCategory: some View {
      AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original" + category.backdropPath!)) { image in
      image.resizable()
    } placeholder: {
      ProgressView()
    }.frame(width: UIScreen.main.bounds.width - 32, height: 250)
    .cornerRadius(30)
  }

  var title: some View {
      HStack {
          Text(category.originalTitle!)
              .font(.system(size: 20)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          Spacer()
      }
  }
    
  var subContent: some View {
      VStack{
          HStack{
              Text("Tanggal Release: " + category.releaseDate!)
                  .font(.system(size: 12)).fontWeight(.light)
              Spacer()
              Text("Rating: " + String(category.voteAverage!))
                  .font(.system(size: 12)).fontWeight(.light)
              Image(systemName: "star.fill").renderingMode(.original).resizable().scaledToFill().frame(width: 15, height: 15).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
          }.padding(.top, 10)
          Text(category.overview!)
              .font(.system(size: 12)).fontWeight(.light).padding(.top, 20)
      }
    }


  var content: some View {
    VStack(alignment: .leading, spacing: 0) {
        title
        subContent
    }
  }
}


