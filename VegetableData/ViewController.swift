//
//  ViewController.swift
//  VegetableData
//
//  Created by Sakshi Yelmame on 12/04/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var vegSearchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    
    var vegetableList = [Vegetable]()
    var searchVeg = [Vegetable]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching
        {
            return searchVeg.count
        }
        else
        {
            return vegetableList.count
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching {
            cell.textLabel?.text = searchVeg[indexPath.row].name
            cell.imageView?.image = UIImage(named: vegetableList[indexPath.row].imagename)
            cell.textLabel?.font = UIFont(name: "Helventica-Bold", size: 20)
        }else {
            cell.textLabel?.text = vegetableList[indexPath.row].name
            cell.imageView?.image = UIImage(named: vegetableList[indexPath.row].imagename)
            cell.textLabel?.font = UIFont(name: "Helventica-Bold", size: 20)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: .main)
        let vc = main.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        if searching == true {
            vc.selectedVegetableInfo = Vegetable(name: searchVeg[indexPath.row].name, imagename: searchVeg[indexPath.row].imagename, description: searchVeg[indexPath.row].description)
        }
        else{
            vc.selectedVegetableInfo = Vegetable(name: vegetableList[indexPath.row].name, imagename: vegetableList[indexPath.row].imagename, description: vegetableList[indexPath.row].description)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchData() {
        
        guard let fileLocation = Bundle.main.url(forResource: "Vegetables", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: fileLocation)
            let receivedData = try JSONDecoder().decode([Vegetable].self, from: data)
            //print(receivedData)
            self.vegetableList = receivedData
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
            
        }
        catch
        {
            print("Error while decoding json")
        }
        
    }
}

extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            searching = true
            searchVeg.removeAll()
            for vegetable in vegetableList {
                if vegetable.name.lowercased().contains(searchText.lowercased()){
                    searchVeg.append(vegetable)
                }
            }
        }
        else
        {
            searching = false
            searchVeg.removeAll()
            searchVeg = vegetableList
        }
        myTableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        myTableView.reloadData()
    }
}
