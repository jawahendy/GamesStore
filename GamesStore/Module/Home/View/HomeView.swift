//
//  HomeView.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import SwiftUI
import Core
import Category

struct HomeView: View {

    @ObservedObject var presenter: GetListPresenter<Any, CategoryGamesModels, AddfavoritModels, Interactor<Any, [CategoryGamesModels], [AddfavoritModels], GetCategoriesRepository<GetCategoriesRemoteDataSource, CategoryTransformer>>>

    @State var favorite = ""

  var body: some View {
    ZStack {
      if presenter.isLoading {
        VStack {
          Text("Loading...")
          ProgressView()
        }
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          ForEach(
            self.presenter.list,
            id: \.id
          ) { category in
              ZStack (alignment: .topTrailing){
               linkBuilder(for: category) {
                CategoryRow(category: category)
              }
             Button(action: {
                    if(self.favorite == ""){
                        self.favorite = String(category.id!)
                        self.presenter.Addfavorit(request: nil, id: category.id!, fav: true)
                    } else {
                        self.favorite = ""
                        self.presenter.Addfavorit(request: nil, id: category.id!, fav: false)
                    }
                    
                }) {
                    Image(systemName: favorite == String(category.id!) ? "heart.fill" : "heart").imageScale(.large)
                }.padding(20)
            }.padding(8)
          }
        }
      }
    }.onAppear {
        if self.presenter.list.count == 0 {
            self.presenter.getList(request: nil)
        }
    }
  }
    
    func linkBuilder<Content: View>(
      for category: CategoryGamesModels,
      @ViewBuilder content: () -> Content
    ) -> some View {

      NavigationLink(
        destination: HomeRouter().makeDetailView(for: category)
      ) { content() }
    }

}
