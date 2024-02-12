//
//  HomeViewModel.swift
//  ZenArcade
//
//  Created by sabiq on 12/02/24.
//

import Foundation


class HomeViewModel:ObservableObject{
    private var gameManager  = GamesManager()
    @Published var games=[Games]()
    
    init(){
        getGames()
        
    }
    
    func getGames(){
        gameManager.getGamesListy { result in
            
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
