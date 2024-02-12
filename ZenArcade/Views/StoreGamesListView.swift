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
    var body: some View {
        NavigationView {
           
                
            VStack {
                List{
                        ForEach(storeGames) { game in
                            StoreGamesCard(storeGame: game)
                        }
                }
                Spacer()
            }.navigationTitle(title)
            
        }
    }
}

#Preview {
    StoreGamesListView(title: "ss",storeGames: [StoreGame]())
}
