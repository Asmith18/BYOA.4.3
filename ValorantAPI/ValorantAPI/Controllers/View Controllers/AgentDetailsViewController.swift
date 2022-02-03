//
//  AgentDetailsViewController.swift
//  ValorantAPI
//
//  Created by adam smith on 2/2/22.
//

import UIKit

class AgentDetailsViewController: UIViewController {

    @IBOutlet weak var descTextLabel: UILabel!
    @IBOutlet weak var roleTextLabel: UILabel!
    
    var agent: Agent?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let agent = agent else {return}
        descTextLabel.text = "Description: \(agent.description)"
        roleTextLabel.text = "Agent Role: \(agent.role)"
        self.title = agent.displayName
        
    }
}
