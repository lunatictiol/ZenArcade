//
//  StoreGamesListView.swift
//  ZenArcade
//
//  Created by sabiq on 12/02/24.
//

import SwiftUI

struct StoreGamesListView: View {
    @State var title:String
    @State var storeGames:[StoreGame]
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.white,.orange,.red], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack {
                    Text("\(title) games👾")
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.pink)
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                            ForEach(storeGames) { game in
                                
                                NavigationLink {
                                    GameDetailsView(id: game.id)
                                        
                                } label: {
                                    
                                    StoreGamesCard(storeGame: game)
                                }

                               
                            }
                    }.padding()
                        
                        
                    Spacer()
                }
            }.toolbar{
                ToolbarItem(placement: .navigation) {
                    Button(action: {
                      dismiss()


                    }, label: {
                      Image(systemName: "chevron.left")
                    })
                }
            }
                
            
        }
    }
}

#Preview {
    StoreGamesListView(title: "ss",storeGames: [StoreGame]())
}
