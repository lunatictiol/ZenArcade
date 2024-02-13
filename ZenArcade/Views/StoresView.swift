//
//  ProfileView.swift
//  ZenArcade
//
//  Created by sabiq on 12/02/24.
//

import SwiftUI

struct StoresView: View {
    @StateObject var vm = StoresViewModel()
    var body: some View {
        NavigationView {
            ZStack{
                
                LinearGradient(colors: [.red,.white], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                
                VStack{
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                            ForEach(vm.stores){store in
                                NavigationLink{
                                    StoreGamesListView(title:store.name,storeGames: store.games)
                                        .navigationBarBackButtonHidden(true)
                                }
                            label:{
                                StoresCard(store: store)
                                    
                                   
                            }
                                    
                                
                            }
                        }
                    }
                    
                }
                
            }.navigationTitle("Stores")
               
        }
    }
}

#Preview {
    StoresView()
}
