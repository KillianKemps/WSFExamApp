//
//  character.swift
//  ExamApp
//
//  Created by Killian on 09/06/16.
//  Copyright © 2016 Web School Factory. All rights reserved.
//

import Foundation

struct Character {
    
    //name, birth_year, height, mass
    let name: String
    let birth_year: String
    let height: Int
    let mass: Int
    
    init(dict: Dictionary<String, AnyObject>) {
        
        //Base info
        name = dict["name"] as! String
        birth_year = dict["birth_year"] as! String
        height = dict["height"] as! Int
        mass = dict["mass"] as! Int
    }
}
