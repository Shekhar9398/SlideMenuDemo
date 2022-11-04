//
//  NewViewController.swift
//  SlideMenu
//
//  Created by Shraddha Manwar on 20/07/22.
//

import UIKit

class NewViewController: UIViewController {
    
    @IBOutlet weak var newListTableView: UITableView!
    
    var newList = [String]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newListTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
    }
    
}

extension NewViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newListTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCell
        
        cell.myLabel.text = newList[indexPath.row]
        
        return cell
    }
    
    
    
    
}

