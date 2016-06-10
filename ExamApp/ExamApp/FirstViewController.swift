//
//  FirstViewController.swift
//  ExamApp
//
//  Created by Iman Zarrabian on 07/06/16.
//  Copyright © 2016 Web School Factory. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var charactersArray: [Character] = []
    var charactersOffset: Int {
        return charactersArray.count
    }
    
    @IBOutlet weak var characterTV: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        characterTV.estimatedRowHeight = 200.0
        characterTV.rowHeight = UITableViewAutomaticDimension
        displayCharacters()
    }
    
    func displayCharacters() {
        
        print("begin display")
        
        Character.getRemoteCharacters (charactersOffset, completionHandler: { (response) in
            
            switch response.result {
            case .Success:
                if let dict = response.result.value as? Dictionary<String, AnyObject> {
                        
                    if let array = dict["results"] as? Array<AnyObject>  {
                        
                        self.charactersArray += array.map
                            { Character(dict: $0 as! [String: AnyObject]) }
                        
                        print("charaters:", self.charactersArray)
                        
                        self.characterTV.reloadData()
                        
                    }
                }
                
            case .Failure(let error):
                print(error)
            }
        })
    }
}

extension FirstViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersArray.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CharacterCell", forIndexPath: indexPath) as! CharacterCell
        
        //let character = charactersArray[indexPath.row]
        cell.nameLabel.text = "John Doe test"
        
        //print("row \(indexPath.row)")
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

