//
//  Movie.swift
//  NavigationApp
//
//  Created by Héctor Eduardo on 03/09/22.
//

import Foundation

struct Movie : Decodable {
    let id : Int
    let title : String
    let year : String
    let runtime : String
    let genres : [String]
    let director : String
    let actors : String
    let plot : String
    let posterUrl : String
    
    enum CodingKeys : String, CodingKey{
        case id
        case title
        case year
        case runtime
        case genres
        case director
        case actors
        case plot
        case posterUrl = "poster_url"
    }
}
