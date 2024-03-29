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
                        if vm.segmentationSelection.rawValue == "Games" {
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing:20) {
                                                ForEach(vm.games){game in
                                                    
                                                    NavigationLink {
                                                        GameDetailsView(id: game.id)
                                                    } label: {
                                                        GameCard(game: game)
                                                    }

                                                    
                                                    
                                                }
                                                
                                               
                                }
                                        }
                                    .transition(.move(edge: .bottom))
                        }
                        else if vm.segmentationSelection.rawValue=="Creators"{
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing:20) {
                                                ForEach(vm.creators){creator in
                                                    
                                                    
                                                        CreatorCard(creator: creator)
                                                    

                                                    
                                                    
                                                }
                                                
                                               
                                }
                                        }
                                    .transition(.move(edge: .bottom))
                            
                            
                        }
                        else if vm.segmentationSelection.rawValue=="Developers"{
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing:20) {
                                                ForEach(vm.devs){dev in
                                                    
                                                   
                                                      DevelopersCard(dev: dev)
                                                    

                                                    
                                                    
                                                }
                                                
                                               
                                }
                                        }
                                    .transition(.move(edge: .bottom))
                            
                            
                        }
                        
                        
                      
                    }
                    .padding()
                    .frame(height: 500)
                
            }.navigationTitle("Arcade")
                .padding(.top,180)
                .background(LinearGradient(colors: [.red,.white], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            
        }
    }
}



#Preview {
    HomeView()
}
