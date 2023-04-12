//
//  ResultViewController.swift
//  VegetableData
//
//  Created by Sakshi Yelmame on 12/04/23.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
   
    var selectedVegetableInfo : Vegetable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.register(FirstTableViewCell.nib(), forCellReuseIdentifier: FirstTableViewCell.identifier)
        myTableView.register(SecondTableViewCell.nib(), forCellReuseIdentifier: SecondTableViewCell.identifire)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = myTableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as! FirstTableViewCell
            if let name = selectedVegetableInfo?.name, let imageName = selectedVegetableInfo?.imagename {
                cell.configure(vegName: name, vegImageName: imageName)
            }
            return cell
        }
        let cell = myTableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifire, for: indexPath) as! SecondTableViewCell
        if let name = selectedVegetableInfo?.description {
            cell.configure(vegDescription: name)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 250
        }
        return UITableView.automaticDimension
    }
    
}

