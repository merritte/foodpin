//
//  ResturantTableViewController.swift
//  FoodPin
//
//  Created by Merritte on 11/2/14.
//  Copyright (c) 2014 Merritte. All rights reserved.
//

import UIKit

class ResturantTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.restaurantNames.count
    }

    /*
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                    let destinationController = segue.destinationViewController as DetailViewController
                    destinationController.restaurantImage = self.restaurantImages[indexPath.row]
                    }
            
                }
            }


    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish",
        "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = [Bool](count:21, repeatedValue: false)
    
   /* override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    // Return the number of rows in the section.
     return self.restaurantNames.count
    } */
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath:
        indexPath) as CustomTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        cell.locationLabel.text = restaurantLocations [indexPath.row]
        cell.typeLabel.text = restaurantTypes [indexPath.row]
            
            if restaurantIsVisited[indexPath.row] {
                cell.accessoryType = .Checkmark
            } else {
                cell.accessoryType = .None
            }
        
        return cell
    }
    
    // POP UP TABLE
    /* override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:
        NSIndexPath) {
            if restaurantIsVisited[indexPath.row] {
                
                // Create an option menu as an action sheet
                let optionMenu = UIAlertController(title: nil, message: "What do you want to do?",
                    preferredStyle: .ActionSheet)
                
                // Add actions to the menu
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                optionMenu.addAction(cancelAction)
                
                
                // Display the menu
                self.presentViewController(optionMenu, animated: true, completion: nil)
                
                let callActionHandler = { (action:UIAlertAction!) -> Void in
                    let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert); alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil)); self.presentViewController(alertMessage, animated: true, completion: nil)
                }
                
                let callAction = UIAlertAction(title: "Call" + " 123-000\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler); optionMenu.addAction(callAction)
                
                let isVisitedUnAction = UIAlertAction(title: "Nevermind, I haven't been here.", style: .Default, handler: {
                    (action: UIAlertAction!) -> Void in
                    
                    let cell = tableView.cellForRowAtIndexPath(indexPath)
                    cell?.accessoryType = .None
                    self.restaurantIsVisited[indexPath.row] = false

                })
                optionMenu.addAction(isVisitedUnAction)
                
                tableView.deselectRowAtIndexPath(indexPath, animated: false)
    
                

    } else {
    
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?",
        preferredStyle: .ActionSheet)
        
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        
        // Display the menu
        self.presentViewController(optionMenu, animated: true, completion: nil)
            
            let callActionHandler = { (action:UIAlertAction!) -> Void in
                let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert); alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil)); self.presentViewController(alertMessage, animated: true, completion: nil)
            }
            
            let callAction = UIAlertAction(title: "Call" + " 123-000\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler); optionMenu.addAction(callAction)
            
            let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: {
                (action: UIAlertAction!) -> Void in
                
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                cell?.accessoryType = .Checkmark
                self.restaurantIsVisited[indexPath.row] = true
            })
            optionMenu.addAction(isVisitedAction)
            
           tableView.deselectRowAtIndexPath(indexPath, animated: false)
            }
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //Delete the row from the data source
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath:
        NSIndexPath) -> [AnyObject] {
        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title:
        "Share", handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
        
        let shareMenu = UIAlertController(title: nil, message: "Share using",
        preferredStyle: .ActionSheet)
        let twitterAction = UIAlertAction(title: "Twitter", style:
        UIAlertActionStyle.Default, handler: nil)
        let facebookAction = UIAlertAction(title: "Facebook", style:
        UIAlertActionStyle.Default, handler: nil)
        let emailAction = UIAlertAction(title: "Email", style: UIAlertActionStyle.Default,
        handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel,
        handler: nil)
        shareMenu.addAction(twitterAction)
        shareMenu.addAction(facebookAction)
        shareMenu.addAction(emailAction)
        shareMenu.addAction(cancelAction)
        self.presentViewController(shareMenu, animated: true, completion: nil)
        }
        )
        var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default,
        title: "Delete",handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
        // Delete the row from the data source
        self.restaurantNames.removeAtIndex(indexPath.row)
        self.restaurantLocations.removeAtIndex(indexPath.row)
        self.restaurantTypes.removeAtIndex(indexPath.row)
        self.restaurantIsVisited.removeAtIndex(indexPath.row)
        self.restaurantImages.removeAtIndex(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        )
        
        shareAction.backgroundColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
            163.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 192.0/255.0, green: 57.0/255.0, blue:
            43.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
        
        
    } */ //END POP UP THING
    
    
    
}
