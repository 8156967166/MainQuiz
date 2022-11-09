//
//  UserProfileViewController.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 22/06/22.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var getModel: UserProfile!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table.name", for: indexPath) as! UserProfileTableViewCell
        cell.nameSet(setModelName: getModel)
      
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "table.cells", for: indexPath) as! UserProfileTableViewCell
        cell2.UserProfile(setUserProfileModels: getModel)
        if indexPath.row == 0 {
            return cell
        }
        return cell2
    }
}
