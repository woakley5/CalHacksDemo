//
//  HistoryTableViewController.swift
//  GuessTheWord
//
//  Created by Will Oakley on 10/23/18.
//  Copyright © 2018 Will Oakley. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    var words: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    @IBAction func dismissHistory(_ sender: Any) {
        self.dismiss(animated: true) {
            print("Dismissed!")
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return words.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        cell.textLabel?.text = words[indexPath.row]
        return cell
    }

}
