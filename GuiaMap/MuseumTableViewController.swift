//
//  MuseumTableViewController.swift
//  GuiaMap
//
//  Created by Roberto Martinez on 21/9/21.
//

import UIKit

struct MuseumItem{
    var title: String?
    var latitude: Double?
    var longitude: Double?

    init (titleStr: String, lat: Double, lng: Double) {
        title = titleStr
        latitude = lat
        longitude = lng
    }
}

class MuseumTableViewController: UITableViewController {
    
    let musArray = [
        UniversityItem(titleStr: "Museo Marte", lat: 13.6924972, lng: -89.2407633),
        UniversityItem(titleStr: "Museo Historia de ESA", lat: 13.6825584, lng: -89.1952684),
        UniversityItem(titleStr: "Museo Forma", lat: 13.700618, lng: -89.2262947),
        UniversityItem(titleStr: "Museo de Aviacion", lat: 13.6958652, lng: -89.1150501),
        UniversityItem(titleStr: "Museo del Ferrocaril", lat: 13.7007455, lng: -89.1798556),
    ]

    var musNameSelected = ""
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
        return musArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musCell", for: indexPath) as! ItemListTableViewCell
        
        // Configure the cell...
        
        cell.titleCell.text = musArray[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        musNameSelected = musArray[indexPath.row].title!
        latSelected = musArray[indexPath.row].latitude!
        lngSelected = musArray[indexPath.row].longitude!
        
        performSegue(withIdentifier: "musToMap", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let mapController = segue.destination as! MapViewController
        
        mapController.titleStr = musNameSelected
        mapController.latMap = latSelected
        mapController.lngMap = lngSelected
        
    }
}
