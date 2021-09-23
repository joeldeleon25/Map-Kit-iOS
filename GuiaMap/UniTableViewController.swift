//
//  UniTableViewController.swift
//  GuiaMap
//
//  Created by Roberto Martinez on 21/9/21.
//

import UIKit

struct UniversityItem {
	var title: String?
	var latitude: Double?
	var longitude: Double?
	
	init (titleStr: String, lat: Double, lng: Double) {
		title = titleStr
		latitude = lat
		longitude = lng
	}
}

class UniTableViewController: UITableViewController {
	
	let uniArray = [
		UniversityItem(titleStr: "UDB", lat: 13.714575, lng: -89.153707),
		UniversityItem(titleStr: "UFG", lat: 13.697631, lng: -89.218930),
		UniversityItem(titleStr: "UNAB", lat: 13.702218, lng: -89.211682),
        UniversityItem(titleStr: "UES", lat: 13.7161076, lng: -89.2056577),
        UniversityItem(titleStr: "USAM", lat: 13.7026047, lng: -89.2029104),
        
	]
	
	
	var uniNameSelected = ""
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
		return uniArray.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellUni", for: indexPath) as! ItemListTableViewCell
		
		// Configure the cell...
		
		cell.titleCell.text = uniArray[indexPath.row].title
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		uniNameSelected = uniArray[indexPath.row].title!
		latSelected = uniArray[indexPath.row].latitude!
		lngSelected = uniArray[indexPath.row].longitude!
		
		performSegue(withIdentifier: "uniToMap", sender: nil)
	}
    
	 // MARK: - Navigation
	 
	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	 // Get the new view controller using segue.destination.
	 // Pass the selected object to the new view controller.
		 
		 let mapController = segue.destination as! MapViewController
		 
		 mapController.titleStr = uniNameSelected
		 mapController.latMap = latSelected
		 mapController.lngMap = lngSelected
	 }
	 
	
}
