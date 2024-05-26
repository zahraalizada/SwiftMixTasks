//
//  FootboallController.swift
//  Newtask
//
//  Created by Zahra Alizada on 11.05.24.
//

import UIKit

class FootboallController: UIViewController {
    
    var teams = [Football]()

    @IBOutlet weak var footballTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Football list task"
        parseFootballFile()
    }
    
    func parseFootballFile() {
        if let file = Bundle.main.url(forResource: "Football", withExtension: "json") {
            do {
                let data = try Data(contentsOf: file)
                teams = try JSONDecoder().decode([Football].self, from: data)
                footballTableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}


extension FootboallController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FootballCell.self)") as! FootballCell
        let team = teams[indexPath.row]
        cell.configure(name: team.name ?? "", footballer: team.footballer ?? "", image: team.icon ?? "")
        return cell
    }
}

extension FootboallController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
