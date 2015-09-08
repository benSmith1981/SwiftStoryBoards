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
    func playerDetailsViewControllerDidSave(controller: PlayersDetailViewController)
}

class PlayersDetailViewController: UITableViewController {

    var delegate: PlayerDetailViewControllerDelegate?
    
    @IBOutlet weak var Cancel: UIBarButtonItem!
    @IBOutlet weak var Done: UIBarButtonItem!
    
    @IBAction func cancelButton(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.playerDetailsViewControllerDidCancel(self)
        }
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.playerDetailsViewControllerDidSave(self)
        }
    }
}