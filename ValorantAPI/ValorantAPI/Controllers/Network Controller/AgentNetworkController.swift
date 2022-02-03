//
//  AgentNetworkController.swift
//  ValorantAPI
//
//  Created by adam smith on 2/2/22.
//

import Foundation

class AgentNetworkController {
    
    private static let baseURLString = "https://valorant-api.com/v1"
    
    private static let agentComponent = "agents"
    
    static func fetchAgent(completion: @escaping ([Agent]?) -> Void) {
        
        guard let baseURL = URL(string: baseURLString) else {return}
        
        let finalURL = baseURL.appendingPathComponent(agentComponent)
        print("the final url")
        URLSession.shared.dataTask(with: finalURL) { agentData, _, error in
            
            if let error = error {
                print("encountered an error")
                completion(nil)
            }
            guard let data = agentData else {return}
            // there is data
            do {
                // try to decode it top level
                if let topLevelDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    // second level
                    if let dataArray = topLevelDictionary["data"] as? [[String: Any]] {
                        // third level
                        var tempAgentArray: [Agent] = []
                        for agentDict in dataArray {
                            if let agent = Agent(dictionary: agentDict) {
                                print(agent.displayName)
                                tempAgentArray.append(agent)
                            }
                        }
                        completion(tempAgentArray)
                    }
                }
            } catch {
                print("encountered error \(error.localizedDescription)")
            }
        } .resume()
    }
}
