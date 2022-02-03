//
//  Agent.swift
//  ValorantAPI
//
//  Created by adam smith on 2/2/22.
//

import Foundation

class Agent {
    
    let displayName: String
    let description: String
    let role: String
    
    init?(dictionary: ([String: Any])) {
        
        guard let displayName = dictionary["displayName"] as? String,
              let description = dictionary["description"] as? String,
              // need to go one more level deep
              let roleDictionary = dictionary["role"] as? [String: Any],
              let role = roleDictionary["displayName"] as? String
        else {return nil}
 
        self.displayName = displayName
        self.description = description
        self.role = role
    }
}
