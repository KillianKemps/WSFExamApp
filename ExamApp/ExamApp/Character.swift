//
//  character.swift
//  ExamApp
//
//  Created by Killian on 09/06/16.
//  Copyright © 2016 Web School Factory. All rights reserved.
//

import Foundation
import Alamofire

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
        //height = dict["height"] as! Int
        height = 0
        //mass = dict["mass"] as! Int
        mass = 0
    }
}

extension Character {
    static func getRemoteCharacters(offset: Int, completionHandler: Response<AnyObject, NSError> -> Void) {
        let param: [String : AnyObject] = ["format" : "json"]
        
        print("Gonna send request")
        
        Alamofire.request(.GET, "http://swapi.co/api/people", parameters: param).responseJSON { response in
            completionHandler(response)
        }
    }
}
