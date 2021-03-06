//
//  CartTableViewController.swift
//  Fushionfastfood
//
//  Created by Fabian on 7/2/20.
//  Copyright © 2020 Fabian Jow. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    var food:[Food] = []
    var foodcontroller:FoodController = FoodController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        food = foodcontroller.Retrievedfood()
        
        tableView.reloadData()
    }
    
    // Getting our data from Core data instead of app delegate
    // Use function retrieve food to get data
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        food = foodcontroller.Retrievedfood()
        
         tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return food.count
    }

     // Setting the data into the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cart", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = food[indexPath.row].namE
        cell.detailTextLabel!.text = String(food[indexPath.row].amounT)

        return cell
    }
    
    // Function to delete the cells for added to card items
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let currentfood = self.food[indexPath.row].namE
        if editingStyle == UITableViewCell.EditingStyle.delete {
            food.remove(at: indexPath.row)

            foodcontroller.deletefood(name: currentfood)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }

    }

    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//            let Storyboard = UIStoryboard(name: "Content", bundle: nil)
//            let DvC = Storyboard.instantiateViewController(withIdentifier: "DetailFoodCvc") as! Checkoutvc
//
//            self.navigationController?.pushViewController(DvC, animated: true)
//
//
//        }
    

    /*
     
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
