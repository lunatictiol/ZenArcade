//
//  MainCardView.swift
//  ZenArcade
//
//  Created by sabiq on 11/02/24.
//

import SwiftUI

struct MainCardView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)
        ){
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300,height: 200)
                .foregroundStyle(.indigo)
                .overlay {
                    Image(systemName:"plus")
                }
            VStack(alignment:.leading){
                Text("Tilte")
                Text("Sub Title")
            }.padding()
            
            
        }
    }
}

#Preview {
    MainCardView()
}
