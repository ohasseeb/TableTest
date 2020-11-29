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
    var states = ["California", "Utah", "Colorado"]
    //var pictures = ["Cow.png", "Dog.png", "gecko.png"]
    var searchable  = [Searchable]()
    // IS there a nicer way to have pictures cause it's not readable to see which picture is which
    var pictures = [#imageLiteral(resourceName: "Dog.png"), #imageLiteral(resourceName: "Cow.png"), #imageLiteral(resourceName: "gecko.png")]
    

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
       
        // Setting the User Name OPtional
        // IS it ok to have an optional this long, can it
        // Be reWritten?, what if one is nil is that ok? [NO] so fix
        if searchable[indexPath.row].user.name != nil && searchable[indexPath.row].user.state != nil && searchable[indexPath.row].user.picture != nil{
            // Diplay User Cell
            let cell : UserCell = tableview.dequeueReusableCell(withIdentifier: "usercell", for: indexPath) as! UserCell
            cell.mylabel.text = searchable[indexPath.row].user.name
            
            //Where is a better place to put this optional? Ans: It's fine because i include it in the if statement
            cell.stateLabel.text = searchable[indexPath.row].user.state
            
            // When Adding an image to an Image View
            // UIIMAGEVIEW.image gives you the image
            cell.animalPicture.image = searchable[indexPath.row].user.picture

            
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
        
//        for each in people {
//            var user = User()
//            user.name = each
//            var element = Searchable()
//            element.user = user
//            self.searchable.append(element)
//        }

        // populate the user with both states and people
        var i = 0
        while(i < people.count)
        {
            var user = User()
            user.name = people[i]
            user.state = states[i]
            user.picture = pictures[i]
            
            
            var element = Searchable()
            element.user = user
            self.searchable.append(element)
            
            i = i + 1
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
        var state: String?
        var picture: UIImage?
        
        // String Optional
        
    }// end User Class
    
    class Place {
        var name : String?
        
    }// end Place class
    
    
    class Searchable {
        //Searchable Class has a NameObject and a PlaceObject
        var place = Place()
        var user  = User()
        
    }
    
}

