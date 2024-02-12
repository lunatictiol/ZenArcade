//
//  ContentView.swift
//  ZenArcade
//
//  Created by sabiq on 11/02/24.
//

import SwiftUI

struct MainView: View {

    
    var body: some View {
        TabView {
            HomeView().tabItem { 
                Image(systemName: "gamecontroller.fill")
                Text("All games") }
            StoresView().tabItem {
                Image(systemName: "house.circle.fill")
                Text("Stores") }
            
        }.tint(.red)
            
            
    }
}

#Preview {
    MainView()
}
