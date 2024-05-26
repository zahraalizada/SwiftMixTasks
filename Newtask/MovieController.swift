//
//  MovieController.swift
//  Newtask
//
//  Created by Zahra Alizada on 13.05.24.
//

import UIKit

class MovieController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    let manager = MovieHelper()
    var movies = [
        Movie(name: "Pirates of the Caribbean: The Curse of the Black Pearl (2003)", 
              actor: "Jhonny Deep", 
              soundtrack: "He's a Pirate"),
        Movie(name: "The Mummy (1999)",
              actor: "Brendan Fraser",
              soundtrack: "The Sand Volcano"),
        Movie(name: "Harry Potter and the Sorcerer's Stone (2001)",
              actor: "Daniel Radcliff",
              soundtrack: "Hedwig's Theme"),
        Movie(name: "Inception (2010)",
              actor: "Leonardo DiCaprio",
              soundtrack: "Time"),
        Movie(name: "Titanic (1997)",
              actor: "Leonardo DiCaprio",
              soundtrack: "My Heart Will Go On")
    ]
    var newMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie"
        
//        manager.saveMovie(data: movies)
        manager.getMovies { movies in
            newMovies = movies
            movieTableView.reloadData()
        }
    }
}


extension MovieController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MovieCell.self)") as! MovieCell
        let movie = newMovies[indexPath.row]
        cell.configure(name: movie.name ?? "", actor: movie.actor ?? "", soundtrack: movie.soundtrack ?? "")
        return cell
    }
}

extension MovieController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            manager.deleteMovieItem(index: indexPath.row) { success in
                if success {
                    newMovies.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    tableView.endUpdates()
                }
            }
        }
    }
}

