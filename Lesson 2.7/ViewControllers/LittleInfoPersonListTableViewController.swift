//
//  littleContactInfoListTableViewController.swift
//  Lesson 2.7
//
//  Created by Kostya on 23.03.2022.
//

import UIKit

class LittleInfoPersonListTableViewController: UITableViewController {

    var personList: [Person]!

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "littleInfoOfPersonID", for: indexPath)
        var cellContent = cell.defaultContentConfiguration()
        let contact = personList[indexPath.row]
        
        cellContent.text = contact.fullname
        cell.contentConfiguration = cellContent
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailPersonInfo = segue.destination
                as? DetailPersonInfoViewController else  { return }
        guard let indexOfTappedRow = tableView.indexPathForSelectedRow else { return }
        let person = personList[indexOfTappedRow.row]
        
        detailPersonInfo.person = person
    }
}
