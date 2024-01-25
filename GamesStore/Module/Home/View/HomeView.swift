//
//  HomeView.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import SwiftUI

struct HomeView: View {

  @ObservedObject var presenter: HomePresenter
    @State var favorite = ""

  var body: some View {
    ZStack {
      if presenter.loadingState {
        VStack {
          Text("Loading...")
          ProgressView()
        }
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          ForEach(
            self.presenter.categories,
            id: \.id
          ) { category in
              ZStack (alignment: .topTrailing){
              self.presenter.linkBuilder(for: category) {
                CategoryRow(category: category)
              }
             Button(action: {
                    if(self.favorite == ""){
                        self.favorite = String(category.id!)
                        self.presenter.addFavCategories(id: category.id!, fav: true)
                    } else {
                        self.favorite = ""
                        self.presenter.addFavCategories(id: category.id!, fav: false)
                    }
                    
                }) {
                    Image(systemName: favorite == String(category.id!) ? "heart.fill" : "heart").imageScale(.large)
                }.padding(20)
            }.padding(8)
          }
        }
      }
    }.onAppear {
      if self.presenter.categories.count == 0 {
        self.presenter.getCategories()
      }
    }
  }

}
