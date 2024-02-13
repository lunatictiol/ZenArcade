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
        HStack(alignment: .center
        ){
           AsyncImage(url: URL(string: game.background_image)) { image in
               image.resizable()
                   .clipShape(RoundedRectangle(cornerRadius: 10))
                   .frame(width: 200, height: 200)
           } placeholder: {
               ProgressView()
           }
           .frame(width: 200, height: 200)
            VStack {
                Text(game.name)
                    .bold()
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .foregroundStyle(.white)
                .lineLimit(2)
                Text(game.released)
                    .font(.subheadline)
                    .foregroundStyle(.white)
            }
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 1, y: 2)
            Spacer()
        }
            
            .frame(width:350,height: 200)
            .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundStyle(LinearGradient(colors: [.red,.pink,.orange], startPoint: .topTrailing, endPoint:.bottom)))
           
       
           
 
           
    }
}

#Preview {
    GameCard(
    game: Games(id: 1, slug: "SS", name: "sjdcnisjnivsjn", released: "RR", background_image: "", rating: 22)
    )
}
