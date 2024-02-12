//
//  HomeView.swift
//  ZenArcade
//
//  Created by sabiq on 11/02/24.
//

import SwiftUI

struct HomeView: View {
    @State var segmentationSelection : ProfileSection = .topGames
    @ObservedObject var vm = HomeViewModel()
    @State var games:[Games]?
    
    init(){
       
           UISegmentedControl.appearance().selectedSegmentTintColor = .orange
     
        
       }
      
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(colors: [.orange,.pink,.red,.black], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                VStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                       MainCardView()
                                        MainCardView()
                                        MainCardView()
                                    }
                                }
                                .frame(height: 100)
                                .padding(30)
                                .transition(.move(edge: .bottom))
                    Spacer()
                    Picker("", selection: $segmentationSelection) {
                               ForEach(ProfileSection.allCases, id: \.self) { option in
                                   Text(option.rawValue)
                               }
                    }.pickerStyle(PalettePickerStyle())
                        
                               .padding()
                    
                    Grid {
                        
                        GridRow {
                            Text("")
                            ForEach(0..<3) { _ in Color.green }
                        }
                        GridRow {
                            Text("")
                            ForEach(0..<4) { _ in Color.green }
                        }
                        GridRow {
                            Text("")
                            ForEach(0..<5) { _ in Color.green }
                        }
                    }
                    
                }.navigationTitle("ZenArcade")
                .padding()
            }
            
            
        }
    }
}

enum ProfileSection : String, CaseIterable {
    case topGames = "Top Games"
    case topSelling = "Top Selling"
    case Recent = "Recent"
}

#Preview {
    HomeView()
}
