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

    override func viewDidLoad() {
        super.viewDidLoad()
        displayCharacters()
    }
    
    func displayCharacters() {
        
        print("begin display")
        
        Character.getRemoteCharacters (charactersOffset, completionHandler: { (response) in
            
            switch response.result {
            case .Success:
                print("case success")
                if let dict = response.result.value as? Dictionary<String, AnyObject> {
                    print("the dict, ", dict)
                        
                    if let array = dict["results"] as? Array<AnyObject>  {
                        
                        self.charactersArray += array.map
                            { Character(dict: $0 as! [String: AnyObject]) }
                        
                        print("charaters:", self.charactersArray)
                        
                        //self.comicTV.reloadData()
                        
                    }
                }
                
            case .Failure(let error):
                print(error)
            }
        })
    }



}

