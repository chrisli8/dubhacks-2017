//
//  MapViewController.swift
//  BenNChrisMaps
//
//  Created by Chris Li on 10/22/17.
//  Copyright © 2017 Chris Li. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: ViewController {
    @IBOutlet weak var addPinBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPinBtn.layer.cornerRadius = 40
        addPinBtn.clipsToBounds = true

        // Do any additional setup after loading the view.
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
