//
//  FoodTableViewController.swift
//  Fushionfastfood
//
//  Created by Fabian on 21/1/20.
//  Copyright © 2020 Fabian Jow. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {

    var appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return min(appDelegate.foodlist.count, appDelegate.imglist.count)

    }
    
    // Setting the data into the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = self.tableView.dequeueReusableCell(withIdentifier: "foodcell", for: indexPath)
              
        let food = appDelegate.foodlist[indexPath.row]
        cell.textLabel!.text = "\(food.namE)"
        cell.detailTextLabel!.text = "\(food.amounT)"
        return cell
    }
    
    // Getting the data to put into the view controller for individual items
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let detail = appDelegate.foodlist[(indexPath as NSIndexPath).row]
        let img = appDelegate.imglist[(indexPath as NSIndexPath).row]
        let Storyboard = UIStoryboard(name: "Content", bundle: nil)
        let DvC = Storyboard.instantiateViewController(withIdentifier: "DetailFoodvc") as! DetailFoodvc
        
        // Placing the data into variables that can be called later in the view controller
        DvC.getname = detail.namE
        DvC.getamt = detail.amounT
        DvC.getimg = img
        
        
        self.navigationController?.pushViewController(DvC, animated: true)
            
            
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
