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
        height = dict["height"] as! Int
        mass = dict["mass"] as! Int
    }
}

extension Character {
    static func getRemoteComics(offset: Int, completionHandler: Response<AnyObject, NSError> -> Void) {
        let apiKey = "c3901f9b2fb11e2322853b3ede27f438"
        let ts = "testtest"
        let hash = "1d312b3f93ad2dbbd2ab9af0a125b73a"
        
        let param: [String : AnyObject] = ["apikey" : apiKey, "hash" : hash, "ts" : ts, "offset": offset]
        
        
        Alamofire.request(.GET, "http://gateway.marvel.com/v1/public/comics", parameters: param).responseJSON { response in
            
            completionHandler(response)
        }
    }
}
