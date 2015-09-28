//
//  GamePickerViewController.swift
//  SwiftStoryboard
//
//  Created by Ben Smith on 09/09/2015.
//  Copyright (c) 2015 Ben Smith. All rights reserved.
//

import Foundation
import UIKit

protocol GamePickerViewControllerDelegate {
    func gamePickerViewController(controller: GamePickerViewController, game:String)
}

class GamePickerViewController: UITableViewController {
    
    var game:String = "Chess"
    var selectedIndex:Int?
    var delegate: GamePickerViewControllerDelegate?
    var games: NSArray = ["Angry Birds",
    "Chess",
    "Russian Roulette",
    "Spin the Bottle",
    "Texas Hold'em Poker",
    "Tic-Tac-Toe"];
    
    override func viewDidLoad() {
        print(self.game)
        selectedIndex = games.indexOfObject(self.game)
    }

    //MARK: UITableviewmethod
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if(selectedIndex != NSNotFound){
            var cell: UITableViewCell =  tableView.cellForRowAtIndexPath(indexPath)!
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        selectedIndex = indexPath.row
        var cell: UITableViewCell =  tableView.cellForRowAtIndexPath(indexPath)!
        cell.accessoryType = UITableViewCellAccessoryType.None
        
        var game: String = games[indexPath.row] as! String
        if var delegate = self.delegate{
            delegate.gamePickerViewController(self, game: game)
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = games[row] as? String
        
        if(indexPath.row == selectedIndex){
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
}