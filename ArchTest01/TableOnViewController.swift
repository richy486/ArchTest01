//
//  TableOnViewController.swift
//  ArchTest01
//
//  Created by Richard Adem on 9/28/16.
//  Copyright © 2016 Richard Adem. All rights reserved.
//

import UIKit

extension UITableView {
    convenience init(dataSource:UITableViewDataSource, delegate:UITableViewDelegate) {
        self.init()
        self.dataSource = dataSource
        self.delegate = delegate
    }
}

class TableOnViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Constatnts
    
    let switchTableOnCellIdentifer = "switchTableOnCellIdentifer"
    let textTableOnCellIdentifer = "textTableOnCellIdentifer"
    
    // MARK: Views
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = self.view.bounds
        
        tableView.register(SwitchWithTextTableViewCell.self, forCellReuseIdentifier: SwitchWithTextTableViewCell.cellIdentifier)
        tableView.register(TextTableViewCell.self, forCellReuseIdentifier: TextTableViewCell.cellIdentifier)
        
        
        
        return tableView
    }()
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = {
            if indexPath.row == 0 {
                return tableView.dequeueReusableCell(withIdentifier: TextTableViewCell.cellIdentifier, for: indexPath)
            } else {
                return tableView.dequeueReusableCell(withIdentifier: SwitchWithTextTableViewCell.cellIdentifier, for: indexPath)
            }
        }()
        
        if let cell = cell as? ConfigurableTableViewCell {
            
            // this is where the magic happens!
            let viewModel = MinionModeViewModel()
            cell.configure(withPresenter: viewModel)
        }
        
        return cell
    }
    
    // MARK: Table view delegate
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
