//
//  ViewController.swift
//  tableTest
//
//  Created by APPLE on 11/28/20.
//  Copyright © 2020 SafeWalk. All rights reserved.
//

import UIKit

//Multi Cell Project

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableview: UITableView!
    var people = ["John Doe", "Harry Potter" , "Jane Doe"]
    var places = ["Paris", "Rome", "Dakar", "New York"]
    var searchable  = [Searchable]()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        populate_array()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searchable[indexPath.row].user.name != nil {
            // Diplay User Cell
            let cell : UserCell = tableview.dequeueReusableCell(withIdentifier: "usercell", for: indexPath) as! UserCell
            cell.mylabel.text = searchable[indexPath.row].user.name
            return cell
        }
        else {
            // Display Place Cell
            let cell : PlaceCell = tableview.dequeueReusableCell(withIdentifier: "placecell", for: indexPath) as! PlaceCell
            cell.mylabel.text = searchable[indexPath.row].place.name
            return cell

        }

    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if searchable[indexPath.row].user.name != nil {
            return 123
        }else {
            return 92
        }// End Optional

    }
    
    
    func populate_array(){
        
        for each in people {
            var user = User()
            user.name = each
            var element = Searchable()
            element.user = user
            self.searchable.append(element)
        }
        
        for each in people {
            var place = Place()
            place.name = each
            var element = Searchable()
            element.place = place
            self.searchable.append(element)
        }// end People for
        tableview.reloadData()
    }// End Populate Array
    
    
    class User {
        var name : String?
        
    }// end User Class
    
    class Place {
        var name : String?
        
    }// end Place class
    
    class Searchable {
        
        var place = Place()
        var user  = User()
        
    }
    
}

