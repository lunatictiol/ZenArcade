//
//  DevelopersCard.swift
//  ZenArcade
//
//  Created by sabiq on 13/02/24.
//

import SwiftUI

struct DevelopersCard: View {
    @State var dev:Developers
    var body: some View {
        HStack(alignment: .center
        ){
            AsyncImage(url: URL(string: dev.image_background)) { image in
               image.resizable()
                   .clipShape(RoundedRectangle(cornerRadius: 10))
                   .frame(width: 200, height: 200)
           } placeholder: {
               ProgressView()
           }
           .frame(width: 200, height: 200)
            VStack {
                Text(dev.name)
                    .bold()
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                .lineLimit(2)
                Text("Games developed: \(dev.games_count)")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
            }
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 1, y: 2)
            Spacer()
        }
            
            .frame(width:350,height: 200)
            .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundStyle(LinearGradient(colors: [.orange,.pink,.white], startPoint: .topTrailing, endPoint:.bottom)))
           
       
           
 
           
    }
}

#Preview {
    DevelopersCard(dev: Developers(id: 22, name: "sss", games_count: 22, image_background: ""))
}
