//
//  GameCard.swift
//  ZenArcade
//
//  Created by sabiq on 12/02/24.
//

import SwiftUI

struct GameCard: View {
    @State var game:Games
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)
        ){
            
                    AsyncImage(url: URL(string: game.background_image)) { image in
                        image.resizable().frame(width: 350,height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                            
                    } placeholder: {
                        ProgressView()
                    }
                        .frame(width: 350,height: 200)
                        .background(RoundedRectangle(cornerRadius: 20)
                     .frame(width: 350,height: 200))
                        .imageScale(.small)
                        
                        .opacity(0.9)
                    
                
            VStack(alignment:.leading){
                
                RoundedRectangle(cornerRadius: 10).frame(width: 200,height: 70)
                    .foregroundStyle(.opacity(0.1))
                    .overlay {
                        
                        VStack {
                            Text(game.name)
                                .bold()
                                .font(.headline)
                                .foregroundStyle(.white)
                            .lineLimit(1)
                            Text(game.released)
                                .font(.caption)
                                .foregroundStyle(.white)
                        }.padding()
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 1, y: 2)
                       
                    }
            }.padding()
                
        }
    }
}

#Preview {
    GameCard(
    game: Games(id: 1, slug: "SS", name: "NN", released: "RR", background_image: "", rating: 22)
    )
}
