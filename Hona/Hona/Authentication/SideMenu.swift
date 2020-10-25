//
//  SideMenu.swift
//  Hona
//
//  Created by ghanima on 10/24/20.
//  Copyright © 2020 ghanima. All rights reserved.
//

import Foundation
import UIKit

protocol MenuControllerDelegate {

    func didSelectMenuItem(named: SideMenuItem)
}
enum SideMenuItem: String, CaseIterable {
    case home = "Home"
    case settings = "Settings"
    case others = "Explore"
    case info = "Info"
}

class MenuController: UITableViewController {
    
    public var delegate: MenuControllerDelegate?
    
    private let menuItems: [SideMenuItem]
    private var color =  UIColor(red: 33/255.0,
                                 green: 33/255.0,
                                 blue: 33/255.0,
                                 alpha: 1)
    
    init(with menuitems: [SideMenuItem]) {
        self.menuItems = menuitems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = color
        view.backgroundColor = color
    }
    
 //Table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.backgroundColor = color
        cell.contentView.backgroundColor = color
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //Relay to delegate about menu item selection
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
