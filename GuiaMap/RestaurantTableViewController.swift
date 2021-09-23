//
//  RestaurantTableViewController.swift
//  GuiaMap
//
//  Created by Roberto Martinez on 21/9/21.
//

import UIKit

struct RestaurantItem{
    var title: String?
    var latitude: Double?
    var longitude: Double?

    init (titleStr: String, lat: Double, lng: Double) {
        title = titleStr
        latitude = lat
        longitude = lng
    }
}


class RestaurantTableViewController: UITableViewController {
    
    let resArray = [
        RestaurantItem(titleStr: "Mikes", lat: 13.6776907, lng: -89.2694286),
        RestaurantItem(titleStr: "Celeste Imperio", lat: 13.6793046, lng: -89.2710937),
        RestaurantItem(titleStr: "Dragon Dorado", lat: 13.6778806, lng: -89.2693761),
        RestaurantItem(titleStr: "Charlie Boy", lat: 13.6756966, lng: -89.2704346),
        RestaurantItem(titleStr: "Clavo y Canela", lat: 13.6700773, lng: -89.2666176),
    ]
    
    var resNameSelected = ""
    var latSelected = 0.0
    var lngSelected = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resCell", for: indexPath) as! ItemListTableViewCell
        
        // Configure the cell...
        
        cell.titleCell.text = resArray[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        resNameSelected = resArray[indexPath.row].title!
        latSelected = resArray[indexPath.row].latitude!
        lngSelected = resArray[indexPath.row].longitude!
        
        performSegue(withIdentifier: "resToMap", sender: nil)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let mapController = segue.destination as! MapViewController
        
        mapController.titleStr = resNameSelected
        mapController.latMap = latSelected
        mapController.lngMap = lngSelected
    }
    
   
}

