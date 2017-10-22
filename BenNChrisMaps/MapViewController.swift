//
//  MapViewController.swift
//  BenNChrisMaps
//
//  Created by Chris Li on 10/22/17.
//  Copyright © 2017 Chris Li. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: ViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    let btn = UIButton(type: .system) as UIButton
    
    // locationManager
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    var dataPoints: [GMSMarker] = [] // Not necessary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // User Location
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func select(marker: GMSMarker) {
        mapView.selectedMarker = marker
        print("SELECTED")
        let alert = CustomPopAlertView(title: "Event Title")
        alert.show(animated: true)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("SELECTED")
        let alert = CustomPopAlertView(title: "Event Title")
        alert.show(animated: true)
        return true
    }
    
    @objc func buttonPressed(sender:UIButton!) {
        
    }
    
    // MARK: - Long press
    // Creates new marker at long press location
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        let pressedLocation = GMSMarker(position: coordinate)
        pressedLocation.icon = GMSMarker.markerImage(with: UIColor.green)
        pressedLocation.title = "Event Name"
        pressedLocation.snippet = "Event Discription"
        pressedLocation.map = mapView
    }
    
    // MARK: - Location Methods
    
    // get location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last

        let camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude,
                                              longitude: userLocation!.coordinate.longitude, zoom: 16.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        self.view = mapView
        
        // Add a button
        btn.backgroundColor = UIColor.blue
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.white, for: .selected)
        btn.titleLabel!.font = UIFont(name: "Avenir Next", size: 26)
        btn.frame = CGRect(x: 260, y: 550, width: 80, height: 80)
        btn.addTarget(self, action: #selector(buttonPressed(sender:)), for: UIControlEvents.touchUpInside)
        btn.layer.cornerRadius = 40
        btn.clipsToBounds = true
        mapView.addSubview(btn)

        locationManager.stopUpdatingLocation()
    }
    
    // Handle incoming location events.
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let location: CLLocation = locations.last!
//        print("Location: \(location)")
//
//        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
//                                              longitude: location.coordinate.longitude,
//                                              zoom: zoomLevel)
//
//        if mapView.isHidden {
//            mapView.isHidden = false
//            mapView.camera = camera
//        } else {
//            mapView.animate(to: camera)
//        }
//
//        listLikelyPlaces()
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
