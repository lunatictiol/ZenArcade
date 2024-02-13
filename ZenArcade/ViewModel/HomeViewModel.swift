//
//  HomeViewModel.swift
//  ZenArcade
//
//  Created by sabiq on 12/02/24.
//

import Foundation


class HomeViewModel:ObservableObject{
    private var gameManager  = GamesManager()
    @Published var segmentationSelection : ProfileSection = .games
    @Published var games=[Games]()
    @Published var creators = [Creators]()
    @Published var devs = [Developers]()
    
    
    init(){
        getGames()
        getCreators()
        getDevs()
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
    func getCreators(){
        gameManager.getCreatorsList() { result in
            
            DispatchQueue.main.async {
                
                
                switch result{
                    
                case .success(let success):
                    self.creators = success.results
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    func getDevs(){
        gameManager.getDevelopersList() { result in
            
            DispatchQueue.main.async {
                
                
                switch result{
                    
                case .success(let success):
                    self.devs = success.results
                case .failure(let failure):
                    print(failure)
                }
            }
        }
        
    }
    
    
    
}

enum ProfileSection : String, CaseIterable {
    case games = "Games"
    case developers = "Developers"
    case creators = "Creators"
}
