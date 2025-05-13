//
//  CoctailsListTableViewController.swift
//  ShakerApp
//
//  Created by Lera Savchenko on 9.05.25.
//

import UIKit

class CoctailsListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as! CustomTableViewCell
        
        cell.cocktailImage.layer.cornerRadius = 20

        return cell
    }
  

   
}
