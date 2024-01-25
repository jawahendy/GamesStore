//
//  Category.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import SwiftUI


struct CategoryRow: View {

  var category: CategoryGamesModel
    
  var body: some View {
      VStack {
          imageCategory
          content
      }
      .frame(width: UIScreen.main.bounds.width - 32, height: 250)
      .cornerRadius(30)
  }

}

extension CategoryRow {

  var imageCategory: some View {
      AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original" + category.posterPath!)) { image in
      image.resizable()
    } placeholder: {
      ProgressView()
    }.scaledToFill().frame(width: UIScreen.main.bounds.width - 32, height: 200)
    .cornerRadius(30)
  }

  var content: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(category.originalTitle ?? "")
        .font(.subheadline)
        .bold().foregroundStyle(.black)
    }.padding(.top, 10)
  }

}


