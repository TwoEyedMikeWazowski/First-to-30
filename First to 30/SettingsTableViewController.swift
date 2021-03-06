//
//  SettingsTableViewController.swift
//  First to 30
//
//  Created by Daniel on 30/6/18.
//  Copyright © 2018 Placeholder Interactive. All rights reserved.
//

import UIKit
var defaults = UserDefaults.standard
class SettingsTableViewController: UITableViewController {
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var tapsStepper: UIStepper!
    var retrievedTaps = defaults.object(forKey: "tapsValue") as? Int ?? 0
    var noofTapsRequired = 30
    override func viewDidLoad() {
        super.viewDidLoad()
        noofTapsRequired = retrievedTaps
        numberLabel.text = String(retrievedTaps)
        tapsStepper.value = Double(retrievedTaps)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    @IBAction func stepper(_ sender: UIStepper) {
        noofTapsRequired = Int(sender.value)
        numberLabel.text = String(noofTapsRequired)
        defaults.set(noofTapsRequired, forKey: "tapsValue")
        
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    //Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveUnwind" {
            let destination = segue.destination as! ScoresTableViewController
            destination.noOfTapsRequired = noofTapsRequired
        }
    }
    func goUnwind (alert: UIAlertAction) {
        performSegue(withIdentifier: "saveUnwind", sender: nil)
    }
    //When the save button is tapped (alert)
    @IBAction func saveTapped(_ sender: Any) {
        if retrievedTaps != noofTapsRequired {
        let alert = UIAlertController(title: "Are you sure you want to save?", message: "Saving will wipe all your previous data.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Proceed", comment: "Default action"), style: .default, handler: goUnwind
        ))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        } else if retrievedTaps == noofTapsRequired {
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        noofTapsRequired = retrievedTaps
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}
