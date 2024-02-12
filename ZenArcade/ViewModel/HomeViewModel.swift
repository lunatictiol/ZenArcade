//
//  HomeViewModel.swift
//  ZenArcade
//
//  Created by sabiq on 12/02/24.
//

import Foundation


class HomeViewModel:ObservableObject{
    private var gameManager  = GamesManager()
    @Published var segmentationSelection : ProfileSection = .topGames
    @Published var games=[Games]()
    
    init(){
        getGames()
        
    }
    
    func getGames(){
        gameManager.getGamesList { result in
            
            DispatchQueue.main.async {
                
                
                switch result{
                    
                case .success(let success):
                    self.games = success.results
                case .failure(let failure):
                    print(failure)
                }
            }
        }
        
    }
    
    
}

enum ProfileSection : String, CaseIterable {
    case topGames = "Top Games"
    case topSelling = "Top Selling"
    case Recent = "Recent"
}
