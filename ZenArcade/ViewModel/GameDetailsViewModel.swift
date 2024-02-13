//
//  GameDetailsViewModel.swift
//  ZenArcade
//
//  Created by sabiq on 13/02/24.
//

import Foundation
class GameDetailsViewModel:ObservableObject{
    private var gameManager  = GamesManager()
    @Published var id :Int?
    @Published var gameDetails:GameDetails?
    @Published var isLoading = true

    func getGameDetails(){
        if let id = id{
            gameManager.getGameDetails(id: id) { result in
                DispatchQueue.main.async {
                    
                    
                    switch result{
                        
                    case .success(let success):
                        self.gameDetails = success
                        self.isLoading = false
                    case .failure(let failure):
                        print(failure)
                        self.isLoading = false
                    }
                }
            }}
    }
    
    
    
}
