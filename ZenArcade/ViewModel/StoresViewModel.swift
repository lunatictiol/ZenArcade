//
//  StoresViewModel.swift
//  ZenArcade
//
//  Created by sabiq on 12/02/24.
//

import Foundation
class StoresViewModel:ObservableObject{
    
    private var gameManager  = GamesManager()
    @Published var stores=[Store]()
    init(){
        getStoresList()
    }
    
    func getStoresList(){
        gameManager.getStoresList{ result in
            
            DispatchQueue.main.async {
                
                
                switch result{
                    
                case .success(let success):
                    self.stores = success.results
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
    
    
    
}
