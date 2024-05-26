//
//  MovieHelper.swift
//  Newtask
//
//  Created by Zahra Alizada on 13.05.24.
//

import Foundation

class MovieHelper {
    
    func getFilePath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("movies.json")
        return path
    }
    
    func saveMovie(data: [Movie]) {
        do {
            let encodedData = try JSONEncoder().encode(data)
            try encodedData.write(to: getFilePath())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getMovies(complete: (([Movie]) -> Void)) {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                let user = try JSONDecoder().decode([Movie].self, from: data)
                complete(user)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteMovieItem(index: Int, complete: (Bool) -> Void) {
        getMovies { movies in
            var updatedMovies = movies
            guard index < updatedMovies.count else {
                complete(false)
                return
            }
            updatedMovies.remove(at: index)
            self.saveMovie(data: updatedMovies)
            complete(true)
        }
    }
}


