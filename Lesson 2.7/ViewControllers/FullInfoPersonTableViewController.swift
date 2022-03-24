//
//  FullInfoContactListTableViewController.swift
//  Lesson 2.7
//
//  Created by Kostya on 23.03.2022.
//

import UIKit

class FullInfoPersonTableViewController: UITableViewController {

    var personList: [Person]!

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        personList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fullInfoOfPersonID", for: indexPath)
        var cellContent = cell.defaultContentConfiguration()
        let person = personList[indexPath.section]
        
        if indexPath.row == 0 {
            cellContent.text = person.fullPhoneNumber
            cellContent.image = UIImage(systemName: "phone")
        }else {
            cellContent.text = person.fullEmail
            cellContent.image = UIImage(systemName: "mail")
        }
        
        cell.contentConfiguration = cellContent
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        personList[section].fullname
    }
}
