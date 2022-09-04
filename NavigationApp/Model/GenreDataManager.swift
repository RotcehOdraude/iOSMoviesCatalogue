//
//  GenreDataManager.swift
//  NavigationApp
//
//  Created by Héctor Eduardo on 03/09/22.
//

import Foundation

enum MovieGenre: String {
    case Adventure
    case Comedy
    case Fantasy
    case Crime
    case Drama
    case Romance
    case SciFi = "Sci-Fi"
    case Thriller
    case Horror
    case Western
    
    var image: String {
        switch self {
        case .Adventure, .Comedy, .Drama, .Horror, .Thriller, .Western, .SciFi:
            return self.rawValue.lowercased()
        case .Fantasy, .Crime, .Romance:
            return self.rawValue.lowercased() + "1"
        }
    }
}

class GenreDataManager {
    private var genres : [Genre] = []
    
    func fetch(){
        if let file = Bundle.main.url(forResource: "genres", withExtension: "json"){
            do {
                let data = try Data(contentsOf: file)
                let decodeGenres = try JSONDecoder().decode([String].self, from: data)
                for genre in decodeGenres{
                    let image = MovieGenre(rawValue: genre) ?? .Adventure
                    genres.append(Genre(genre: genre, image: image.image))
                }
            } catch{
                print("error: ", error)
            }
        }
    }
    
    func genreCount() -> Int{
        return genres.count
    }
    
    func genreAt(index : Int) -> Genre{
        return genres[index]
    }
    
    func genreValue(index: Int) -> String{
        return genres[index].genre
    }
}
