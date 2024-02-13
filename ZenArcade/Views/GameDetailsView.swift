//
//  GameDetailsView.swift
//  ZenArcade
//
//  Created by sabiq on 12/02/24.
//

import SwiftUI

struct GameDetailsView: View {
    @State var id:Int
    @StateObject var vm = GameDetailsViewModel()
   
    var body: some View {
        
    
      VStack{
                
                    if vm.isLoading {
                        VStack{
                            ProgressView()
                            
                        }
                        
                        
                    }else
                    {
                      
                            
            VStack {
                Text(vm.gameDetails?.name ?? "Game")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                
                
                                AsyncImage(url: URL(string: vm.gameDetails?.background_image ?? "")) { image in
                                    image.resizable().frame(width:350,height: 200)
                                        .padding()
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                if let ratings = vm.gameDetails?.ratings{
                                
                                 
                                    ScrollView(.horizontal,showsIndicators: false){
                                        HStack(alignment:.center){
                                                ForEach(ratings){ rating in
                                                    Text(rating.title + ":" ).bold().font(.subheadline)
                                                        .foregroundStyle(.white)
                                                    Text(String(rating.count )).bold().font(.subheadline)
                                                        .foregroundStyle(.white)
                                                }
                                        }.padding()
                                        
                                    } .frame(width:300, height: 30)
                                        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundStyle(
                                            LinearGradient(colors:[.red,.orange] , startPoint: .leading, endPoint: .trailing)
                                        ))
                               
                                    
                                    }
                ScrollView {
                    VStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                   .frame(width:350,height: 350)
                                   .padding()
                                   .overlay {
                                       
                               
                                           
                                           ScrollView {
                                               
                                               
                                               VStack {
                                                   Text("Description")
                                                       .foregroundStyle(.white)
                                                       .bold()
                                                       .font(.headline)
                                                   Text(vm.gameDetails?.description_raw ?? "")
                                                       .font(.subheadline)
                                                       .padding()
                                                       .foregroundStyle(.white)
                                                       
                                                
                                                   .fontWeight(.semibold)
                                               }
                                           }.frame(width: 320, height: 320)
                                       
                                   }
                                   .foregroundStyle( LinearGradient(colors: [.red,.pink], startPoint: .top, endPoint: .bottom))
                               .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        
                  
                        
                        
                        
                    }
                }
                
                             
                            
                        }.padding()
                         
                    }
                    
                }.onAppear(
                    perform: {
                        vm.id = id
                        vm.getGameDetails()
                        
                    }
            )
                .background(
                    LinearGradient(colors: [.mint,.white], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                
                
        }
        
       
            
    
}

#Preview {
    GameDetailsView(id: 10)
}
