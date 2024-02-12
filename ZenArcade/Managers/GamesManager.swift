//
//  GamesManager.swift
//  ZenArcade
//
//  Created by sabiq on 12/02/24.
//

import Foundation
class GamesManager {
    private var apiKey  = "607672ceca2f4092b55249ac93f2999a"
    
    
    func getGamesListy(completion: @escaping (Result<ApiResponse,ApiError>)->Void){
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
    
    
}



enum ApiError:Error{
    case invalidURL
    case invalidData
}

struct ApiResponse:Decodable{
    let results: [Games]
    

}

struct Games:Decodable{
    
       let id: Int
       let slug, name, released: String
       let background_image: String
       let rating: Double
}

