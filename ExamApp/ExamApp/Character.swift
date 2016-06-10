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

    // Set as Int32 instead of Int because of NSString casting below
    let height: Int32
    let mass: Int32
    
    init(dict: Dictionary<String, AnyObject>) {
        
        //Base info
        name = dict["name"] as! String
        birth_year = dict["birth_year"] as! String

        // Requires NSString casting because the JSON seems to return String
        height = (dict["height"] as! NSString).intValue
        mass = (dict["mass"] as! NSString).intValue
    }
}

extension Character {
    static func getRemoteCharacters(offset: Int, completionHandler: Response<AnyObject, NSError> -> Void) {
        let param: [String : AnyObject] = ["format" : "json"]

        Alamofire.request(.GET, "http://swapi.co/api/people", parameters: param).responseJSON { response in
            completionHandler(response)
        }
    }
}
