//
//  SpecialityTableViewController.swift
//  UNIchoice
//
//  Created by Mac on 30.04.17.
//  Copyright © 2017 AMD. All rights reserved.
//

import UIKit
import RealmSwift

class SpecialityTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    let realm = try! Realm()
    var specialities: Results<Speciality>! {
        didSet {
            tableView.reloadData()
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        specialities = realm.objects(Speciality.self)

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        
        searchBar.delegate = self
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return specialities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialityTableViewCell", for: indexPath)
        cell.textLabel?.text = specialities[indexPath.row].name
        // Configure the cell...

        return cell
    }

    //MARK: - search bar delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        specialities = realm.objects(Speciality.self).filter(String(format: "name contains '%@'", searchText))
    }
    
    // MARK: - table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let spec = specialities[indexPath.row]
        let universitiesTableViewController = storyboard?.instantiateViewController(withIdentifier: "UniversitiesTableViewController") as! UniversitiesTableViewController
        universitiesTableViewController.selectedSpeciality = spec
        navigationController?.pushViewController(universitiesTableViewController, animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
