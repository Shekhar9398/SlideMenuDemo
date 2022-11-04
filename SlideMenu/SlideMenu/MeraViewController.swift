//
//  MeraViewController.swift
//  SlideMenu
//
//  Created by Shraddha Manwar on 19/07/22.
//

import UIKit

class MeraViewController: UIViewController  {
    
    @IBOutlet weak var sideMenuTableView: UITableView!
    
    var menuList : [String] = ["Favorites","About","Order","MyInfo"]
    
    var newList = [NewStruct] ()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newList = [NewStruct(list: ["Swift","iOS","iPhone"]) ,
                   NewStruct(list: ["Name", "Details", "Address"]),
                   NewStruct(list: ["Shipping", "Status"]) ,
        NewStruct(list: ["Fresher", "iOS Developer"])]
        
        
        sideMenuTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "Cell")
        sideMenuTableView.rowHeight = 100
    }
    
}
extension MeraViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = sideMenuTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as! MyCell
        
        cell.myLabel.text = menuList[indexPath.row]
        cell.myLabel.textColor = .white
        cell.myImage.image = UIImage(named:"Mycon")
        cell.backgroundColor = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let pushedVc = storyboard.instantiateViewController(withIdentifier: "NewViewController") as! NewViewController

        pushedVc.newList = newList[indexPath.row].list
        
        navigationController?.pushViewController(pushedVc, animated: true)
        
    }
    
}
