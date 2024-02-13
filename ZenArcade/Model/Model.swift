//
//  Model.swift
//  ZenArcade
//
//  Created by sabiq on 13/02/24.
//

import Foundation

enum ApiError:Error{
    case invalidURL
    case invalidData
}

struct ApiResponse:Decodable{
    let results: [Games]
    

}

struct Games:Decodable,Identifiable{
    
       let id: Int
       let slug, name, released: String
       let background_image: String
       let rating: Double
}

struct StoreResult:Decodable {
   
    let results: [Store]
}

struct Store:Decodable,Identifiable {
    let id: Int
    let name, domain, slug: String
    let games_count: Int
    let games: [StoreGame]
}
struct StoreGame:Decodable,Identifiable{
       let id: Int
       let slug, name: String
       let added: Int
}
struct GameDetails:Decodable{
    let id: Int
    let name:String
    let background_image: String

    let platforms: [PlatformElement]
    let description_raw:String
    let ratings: [Rating]
}
struct PlatformElement:Decodable {
    
    let platform: platformDetails
    let released_at: String

}
struct platformDetails :Decodable, Identifiable{
    let id: Int
    let name, slug: String
    let image_background: String
}

struct Rating:Decodable,Identifiable {
    let id: Int
    let title: String
    let count: Int
    let percent: Double
}


struct CreatorResponse:Decodable{

        let results: [Creators]
    
}

struct Creators:Decodable,Identifiable {
    let id: Int
    let name: String
    let image: String
    let games_count:Int
  
}

struct DevelopersResponse:Decodable {
   let results: [Developers]
}

struct Developers:Decodable,Identifiable {
    let id: Int
    let name:String
    let games_count: Int
    let image_background: String
    
}

