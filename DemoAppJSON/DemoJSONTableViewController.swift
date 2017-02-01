//
//  DemoJSONTableViewController.swift
//  DemoAppJSON
//
//  Created by Dave Tille on 1/31/17.
//  Copyright © 2017 Dave Tille. All rights reserved.
//

import UIKit

class DemoJSONTableViewController: UITableViewController {
    
    var listData = [[String: AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url:String = "http://hardbooter.org/service2.php/"
        let urlRequest = URL(string: url)
        URLSession.shared.dataTask(with: urlRequest!, completionHandler: {
            (data, response, error) in
            if (error != nil) {
                print(error.debugDescription)
            }else{
                do{
                    self.listData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                        as! [[String: AnyObject]]
                    
                        self.tableView.reloadData()
                    
                }catch let error as NSError{
                    print(error)
                }
            }
            
        }).resume()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return  1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listData.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

     let item = self.listData[indexPath.row]
        cell.textLabel?.text = item["name"] as? String
        cell.detailTextLabel?.text = item["brand"] as? String
        print(self.listData.count)
        return cell
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
