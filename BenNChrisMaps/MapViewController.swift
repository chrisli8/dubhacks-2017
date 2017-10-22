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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // User Location
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        //mapView.delegate = self
        
        placesClient = GMSPlacesClient.shared()
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
//        let camera = GMSCameraPosition.camera(withLatitude: 47.6549516, longitude: -122.3089823, zoom: 9.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        view = mapView
        
        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
        
//        // Add a button
//        btn.backgroundColor = UIColor.blue
//        btn.setTitle("Add", for: .normal)
//        btn.setTitleColor(UIColor.white, for: .normal)
//        btn.setTitleColor(UIColor.white, for: .selected)
//        btn.titleLabel!.font = UIFont(name: "Avenir Next", size: 26)
//        btn.frame = CGRect(x: 250, y: 550, width: 80, height: 80)
//        btn.addTarget(self, action: #selector(buttonPressed(sender:)), for: UIControlEvents.touchUpInside)
//        btn.layer.cornerRadius = 40
//        btn.clipsToBounds = true
//        mapView.addSubview(btn)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func buttonPressed(sender:UIButton!) {
        
    }
    
    // MARK: - Long press
    // Creates new marker at long press location
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        let pressedLocation = GMSMarker(position: coordinate)
        pressedLocation.title = "New Location"
        pressedLocation.snippet = "\(coordinate.latitude), \(coordinate.longitude)"
        pressedLocation.map = mapView
    }
    
    // MARK: - Location Methods
    
    // get location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last

        let camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude,
                                              longitude: userLocation!.coordinate.longitude, zoom: 13.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
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
