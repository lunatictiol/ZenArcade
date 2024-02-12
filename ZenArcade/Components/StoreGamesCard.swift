//
//  StoreGamesCard.swift
//  ZenArcade
//
//  Created by sabiq on 12/02/24.
//

import SwiftUI

struct StoreGamesCard: View {
    @State var storeGame:StoreGame
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10 )
                .frame(maxWidth: .infinity,minHeight: 150)
                .foregroundStyle(
                LinearGradient(colors: [.accentColor,.blue], startPoint: .top, endPoint: .bottom)
                    )
                .overlay {
                    VStack{
                        Text(storeGame.name)
                            .bold()
                            .foregroundStyle(.white)
                            .font(.title3)
                        Text(String(storeGame.added))
                            .foregroundStyle(.white)
                            .font(.footnote)
                        
                    }
                }
            
            
        }
    }
}

#Preview {
    StoreGamesCard(storeGame: StoreGame(id: 1, slug: "ss", name: "game", added:11))
}
