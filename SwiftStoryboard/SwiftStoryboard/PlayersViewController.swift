//
//  PlayersViewController.swift
//  
//
//  Created by Ben Smith on 06/09/2015.
//
//
import UIKit
import Foundation
class PlayersViewController: UITableViewController,  PlayerDetailViewControllerDelegate{
    @IBOutlet var playersTableView: UITableView!
    var players: NSMutableArray = []
    
    override func viewDidLoad() {
        var player = Player(name: "Bill Evans",game: "Tic-Tac-Toe",rating: 4)
        players.addObject(player)
        
        player = Player(name: "Oscar Peterson",game: "Spin the Bottle",rating: 5)
        players.addObject(player)
        
        player = Player(name: "Dave Brubeck",game: "Texas holdem poker",rating: 2)
        players.addObject(player)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var CellIdentifier: String = "PlayerCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        let player: Player = players[row] as! Player
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = player.game
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        println(players[row])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PlayerDetailModalSegue"{
            let navigationController = segue.destinationViewController as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? PlayersDetailViewController
            
            if let viewController = addItemViewController {
                viewController.delegate = self
            }
        }
    }
    
    //PlayerDetailsViewControllerDelegate
    func playerDetailsViewControllerDidCancel(controller: PlayersDetailViewController){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func playerDetailsViewControllerDidSave(controller: PlayersDetailViewController, player:Player){
        players.addObject(player)
        
    }
}
