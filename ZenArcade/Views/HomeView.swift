//
//  HomeView.swift
//  ZenArcade
//
//  Created by sabiq on 11/02/24.
//

import SwiftUI

struct HomeView: View {
    

    @StateObject var vm = HomeViewModel()
  
    
    init(){
       
           UISegmentedControl.appearance().selectedSegmentTintColor = .orange
     
        
       }
      
    var body: some View {
        NavigationView{
            VStack {
              
                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack {
                                            ForEach(vm.games){game in
                                                MainCard(game: game)
                                            }
                                            
                                           
                                        }
                                    }
                                 
                                    .frame(height: 100)
                                 
                                    
                                .transition(.move(edge: .bottom))
              
                 
                Picker("", selection: $vm.segmentationSelection) {
                               ForEach(ProfileSection.allCases, id: \.self) { option in
                                   Text(option.rawValue)
                               }
                    }.pickerStyle(PalettePickerStyle())
                        .padding(.top,60)
                    VStack{
                        ScrollView(.vertical, showsIndicators: false) {
                                        VStack {
                                            ForEach(vm.games){game in
                                                GameCard(game: game)
                                                
                                            }
                                            
                                           
                                        }
                                    }
                                 
                            
                                    .transition(.move(edge: .bottom))
                    }
                    .frame(height: 500)
                
            }.navigationTitle("ZArcade")
                .padding(.top,180)
                .background(LinearGradient(colors: [.red,.white], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            
        }
    }
}



#Preview {
    HomeView()
}
