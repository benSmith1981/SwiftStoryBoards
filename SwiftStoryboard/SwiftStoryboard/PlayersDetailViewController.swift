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

class PlayersDetailViewController: UITableViewController, GamePickerViewControllerDelegate{

    var delegate: PlayerDetailViewControllerDelegate?
    var game: String = "Chess"
    
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

    // MARK: Methods called upon opening and closing view
    override func viewDidLoad() {
        self.detailLabel.text = game
    }
    
    override func awakeFromNib() {
        NSLog("init PlayerDetailsViewController");
    }
    
    deinit{
        NSLog("dealloc PlayerDetailsViewController");
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PickGame"{
            let navigationController = segue.destinationViewController as? GamePickerViewController
//            let addItemViewController = navigationController as GamePickerViewController
            if let viewcontroller = navigationController{
                viewcontroller.delegate = self
                viewcontroller.game = game
            }
        }
    }
    
    //MARK: GamePickerViewControllerDelegate
    func gamePickerViewController(controller: GamePickerViewController, game:String){
        self.game = game
        self.detailLabel.text = self.game
        
        self.navigationController?.popViewControllerAnimated(true)
    }

}