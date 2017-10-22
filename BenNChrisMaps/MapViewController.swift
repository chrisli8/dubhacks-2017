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
    let btn = UIButton(type: .system) as UIButton
    
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
        
        // Add a button
        btn.backgroundColor = UIColor.blue
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.white, for: .selected)
        btn.titleLabel!.font = UIFont(name: "Avenir Next", size: 36)
        btn.frame = CGRect(x: 250, y: 550, width: 80, height: 80)
        btn.addTarget(self, action: #selector(buttonPressed(sender:)), for: UIControlEvents.touchUpInside)
        btn.layer.cornerRadius = 40
        btn.clipsToBounds = true
        mapView.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func buttonPressed(sender:UIButton!) {
        
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
