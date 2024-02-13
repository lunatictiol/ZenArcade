//
//  GamesManager.swift
//  ZenArcade
//
//  Created by sabiq on 12/02/24.
//

import Foundation
class GamesManager {
    private var apiKey  = ""
   
    
    func getGamesList(completion: @escaping (Result<ApiResponse,ApiError>)->Void){
        guard let url = URL(string: "https://api.rawg.io/api/games?key=\(apiKey)") else {
            completion(.failure(ApiError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error==nil else{
                print("1")
                completion(.failure(ApiError.invalidData))
                return
            }
            
            do {
                let games = try JSONDecoder().decode(ApiResponse.self, from: data )
                completion(.success(games))
            }
            catch{
                print("2")
                completion(.failure(ApiError.invalidData))
            }
        }.resume()

        
        
        
    }
    func getStoresList(completion: @escaping (Result<StoreResult,ApiError>)->Void){
        guard let url = URL(string: "https://api.rawg.io/api/stores?key=\(apiKey)") else {
            completion(.failure(ApiError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error==nil else{
                print("1")
                completion(.failure(ApiError.invalidData))
                return
            }
            
            do {
                let games = try JSONDecoder().decode(StoreResult.self, from: data )
                completion(.success(games))
            }
            catch{
                print("2")
                completion(.failure(ApiError.invalidData))
            }
        }.resume()

        
        
        
    }
    func getGameDetails(id:Int, completion: @escaping (Result<GameDetails,ApiError>)->Void){
        guard let url = URL(string: "https://api.rawg.io/api/games/\(id)?key=\(apiKey)") else {
            completion(.failure(ApiError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error==nil else{
                print("1")
                completion(.failure(ApiError.invalidData))
                return
            }
            
            do {
                let games = try JSONDecoder().decode(GameDetails.self, from: data )
                completion(.success(games))
            }
            catch{
                print("2")
                completion(.failure(ApiError.invalidData))
            }
        }.resume()

        
        
        
    }
    
    
    func getCreatorsList(completion: @escaping (Result<CreatorResponse,ApiError>)->Void){
        guard let url = URL(string: "https://api.rawg.io/api/creators?key=\(apiKey)") else {
            completion(.failure(ApiError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error==nil else{
                print("1")
                completion(.failure(ApiError.invalidData))
                return
            }
            
            do {
                let creators = try JSONDecoder().decode(CreatorResponse.self, from: data )
                completion(.success(creators))
            }
            catch{
                print("2")
                completion(.failure(ApiError.invalidData))
            }
        }.resume()

        
        
        
    }
    
    
    func getDevelopersList(completion: @escaping (Result<DevelopersResponse,ApiError>)->Void){
        guard let url = URL(string: "https://api.rawg.io/api/developers?key=\(apiKey)") else {
            completion(.failure(ApiError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error==nil else{
                print("1")
                completion(.failure(ApiError.invalidData))
                return
            }
            
            do {
                let devs = try JSONDecoder().decode(DevelopersResponse.self, from: data )
                completion(.success(devs))
            }
            catch{
                print("2")
                completion(.failure(ApiError.invalidData))
            }
        }.resume()

        
        
        
    }
    
    
}



