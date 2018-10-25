//
//  HistoryTableViewController.swift
//  GuessTheWord
//
//  Created by Will Oakley on 10/23/18.
//  Copyright © 2018 Will Oakley. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    /* Arrays for cells that are populated in ViewController's prepareForSegue */
    var words: [String]!
    var tries: [Int]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /* Reloads table data with new data from ViewController's prepareForSegue */
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    /* Dismisses this modal to go back to ViewController */
    @IBAction func dismissHistory(_ sender: Any) {
        self.dismiss(animated: true) {
            print("Dismissed!")
        }
    }

    /* TableView only has one section */
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    /* Number of cells correlates to number of correct answers (length of words array) */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    /* Populates Default cell w/ subtitle with info from arrays above. Called once for each cell necessary as determined by numberOfRowsInSection */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        cell.textLabel?.text = words[indexPath.row]
        cell.detailTextLabel?.text = "Took " + String(tries[indexPath.row]) + " tries"
        return cell
    }

}
