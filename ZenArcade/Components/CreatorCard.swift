//
//  DeveloperCrd.swift
//  ZenArcade
//
//  Created by sabiq on 13/02/24.
//

import SwiftUI

struct CreatorCard: View {
    @State var creator:Creators
    var body: some View {
        HStack(alignment: .center
        ){
            AsyncImage(url: URL(string: creator.image)) { image in
               image.resizable()
                   .clipShape(RoundedRectangle(cornerRadius: 10))
                   .frame(width: 200, height: 200)
           } placeholder: {
               ProgressView()
           }
           .frame(width: 200, height: 200)
            VStack {
                Text(creator.name)
                    .bold()
                    .font(.title3)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                .lineLimit(2)
                Text("number of games \(creator.games_count)")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
            }
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 1, y: 2)
            Spacer()
        }
            
            .frame(width:350,height: 200)
            .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundStyle(LinearGradient(colors: [.red,.pink,.white], startPoint: .topTrailing, endPoint:.bottom)))
           
       
           
 
           
    }
}

#Preview {
    CreatorCard(creator: Creators(id: 11, name: "devvv", image: "", games_count: 22))
}
