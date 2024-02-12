//
//  StoresView.swift
//  ZenArcade
//
//  Created by sabiq on 12/02/24.
//

import SwiftUI

struct StoresCard: View {
    @State var store:Store
    var body: some View {
        ZStack{
           
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 180,height: 100)
                .foregroundStyle(
                    LinearGradient(colors: [.clear,.orange,.red], startPoint: .top, endPoint: .bottom)
                )
            VStack{
                Text(store.name)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    
                    
                Text("🎮\(store.games_count)").foregroundStyle(.white)
                    .font(.subheadline)
            }.padding()
                
        }
        
    }
}

#Preview {
    StoresCard(store: Store(id: 1, name: "name", domain: "domain", slug: "", games_count: 222, games: [StoreGame]()))
}
