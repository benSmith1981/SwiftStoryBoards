//
//  PlayersDetailViewController.swift
//  SwiftStoryboard
//
//  Created by Ben Smith on 08/09/2015.
//  Copyright (c) 2015 Ben Smith. All rights reserved.
//

import Foundation
import UIKit

protocol PlayerDetailViewControllerDelegate{
    func playerDetailsViewControllerDidCancel(controller: PlayersDetailViewController)
    func playerDetailsViewControllerDidSave(controller: PlayersDetailViewController, player:Player)
}

class PlayersDetailViewController: UITableViewController {

    var delegate: PlayerDetailViewControllerDelegate?
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var Cancel: UIBarButtonItem!
    @IBOutlet weak var Done: UIBarButtonItem!
    
    // MARK: UITableViewMethods

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0{
            nameTextField.becomeFirstResponder()
        }
    }
    
    // MARK: IBaction methods
    @IBAction func cancelButton(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.playerDetailsViewControllerDidCancel(self)
        }
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        
        var player = Player(name: nameTextField.text, game: "Game", rating: 1)
        if let delegate = self.delegate {
            delegate.playerDetailsViewControllerDidSave(self, player: player)
        }
    }

}