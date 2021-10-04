//
//  UniversitiesTableViewController.swift
//  UNIchoice
//
//  Created by Mac on 29.04.17.
//  Copyright © 2017 AMD. All rights reserved.
//

import UIKit
import RealmSwift
class UniversitiesTableViewController: UITableViewController {
    let realm = try! Realm()
    var universities: List<University>! {
        didSet {
            tableView.reloadData()
        }
    }
    
    var sortedUniversitiesData: Results<University>! {
        didSet{
            universities = List(sortedUniversitiesData)
        }
    }
    
    var selectedUniversity: University!
    
    var selectedSpeciality: Speciality!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
//        universities.filter("")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var sortedResult = realm.objects(University.self).filter(String(format: "ANY specialities.id == %i", selectedSpeciality.id)).filter(String(format: "price < %i", FilterManager.sharedInstance.price))
        if let filterCountry = FilterManager.sharedInstance.country {
            sortedResult = sortedResult.filter(String(format: "country.id == %i", filterCountry.id))
        }
        if FilterManager.sharedInstance.certificates.count > 0 {
            let filtredCertificates = FilterManager.sharedInstance.certificates
            var filter = String()
            for filtredCertificate in filtredCertificates {
                if filter.characters.count > 0 {
                    filter.append(" OR ")
                }
                filter.append(String(format: "(ANY certificates.id == %i AND ANY certificates.value <= %f)", filtredCertificate.id, filtredCertificate.value))
            }
            
            sortedUniversitiesData = sortedResult.filter(filter)
        } else {
            sortedUniversitiesData = sortedResult
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return universities.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityTableViewCell", for: indexPath) as! UniversityTableViewCell
        cell.name?.text = universities[indexPath.row].name
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedUniversity = universities[indexPath.row]
        performSegue(withIdentifier: "ShowUniversityInfo", sender: self)
    }

    @IBAction func sortButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Сортировка", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cancelAction = UIAlertAction(title: "Отмена", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addAction(cancelAction)
        let priceSortAction = UIAlertAction(title: "Цена", style: UIAlertActionStyle.default) { (action) in
            self.sortedUniversitiesData = self.sortedUniversitiesData.sorted(byKeyPath: "price", ascending: false)
        }
        alertController.addAction(priceSortAction)
        let alphabetSortAction = UIAlertAction(title: "Алфавит", style: UIAlertActionStyle.default) { (action) in
            self.sortedUniversitiesData = self.sortedUniversitiesData.sorted(byKeyPath: "name")
        }
        alertController.addAction(alphabetSortAction)
        let ratingSortAction = UIAlertAction(title: "Рейтинг", style: UIAlertActionStyle.default) { (action) in
            self.sortedUniversitiesData = self.sortedUniversitiesData.sorted(byKeyPath: "rating", ascending: false)
        }
        alertController.addAction(ratingSortAction)
        
        present(alertController, animated: true, completion: nil)

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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier, identifier == "ShowUniversityInfo" {
            let universityInfoTableViewController = segue.destination as! UniversityInfoTableViewController
            universityInfoTableViewController.university = selectedUniversity
        }
        
    }

}
