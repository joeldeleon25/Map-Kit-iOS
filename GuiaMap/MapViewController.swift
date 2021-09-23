//
//  MapViewController.swift
//  GuiaMap
//
//  Created by Roberto Martinez on 21/9/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UINavigationControllerDelegate {
	
	@IBOutlet weak var mapView: MKMapView!
	
	var titleStr = ""
	var latMap = 0.0
	var lngMap = 0.0
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = titleStr
		
		let annotation = MKPointAnnotation()
		
		annotation.coordinate = CLLocationCoordinate2D(latitude: latMap, longitude: lngMap)
		mapView.addAnnotation(annotation)
		
		
		// Do any additional setup after loading the view.
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
