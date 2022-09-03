//
//  MovieDataManger.swift
//  NavigationApp
//
//  Created by Héctor Eduardo on 03/09/22.
//

import Foundation

class MovieDataManager{
    private var movies : [Movie] = []
    
    func fetch( genre : String ){
        if let file = Bundle.main.url(forResource: "movies", withExtension: "json"){
            do {
                let data = try Data(contentsOf: file)
                let decodeMovies = try JSONDecoder().decode([Movie].self, from: data)
                movies = decodeMovies.filter(
                    {$0.genres.contains(genre)}
                )
                print(movies)
            } catch {
                print("Error ",error)
            }
        }
    }
    
    func movieCount() -> Int {
        return movies.count
    }
    
    func movieAt(index : Int) -> Movie {
        return movies[index]
    }
}
