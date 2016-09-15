//
//  ViewController.swift
//  CallStatusDashboard
//
//  Created by Sam Agnew on 9/13/16.
//  Copyright © 2016 Sam Agnew. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let phoneCallCellIdentifier = "PhoneCallCell"
    let phoneCalls: [String] = []
    
    @IBOutlet var callStatusTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callStatusTableView.delegate = self
        self.callStatusTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.phoneCalls.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: phoneCallCellIdentifier, for: indexPath)
        
        return cell
    }
    
}

