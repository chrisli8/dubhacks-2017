//
//  CustomPopAlertView.swift
//  Lollipop
//
//  Created by Chris Li on 9/12/17.
//  Copyright © 2017 Chris Li. All rights reserved.
//

import Foundation

import UIKit

class CustomPopAlertView: UIView, Modal {
    
    var backgroundView = UIView()
    
    var dialogView = UIView()
    
    convenience init(title:String) {
        self.init(frame: UIScreen.main.bounds)
        initialize(title: title)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize(title:String){
        
        dialogView.clipsToBounds = true
        
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.6
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        addSubview(backgroundView)
        
        let dialogViewWidth = frame.width - 64
        let dialogViewHeight = dialogViewWidth
        
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 30, width: dialogViewWidth-16, height: 30))
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 28.0)
        dialogView.addSubview(titleLabel)
        
        // Add a button
        let btn = UIButton(type: .system) as UIButton
        btn.backgroundColor = UIColor.blue
        btn.setTitle("Done", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.white, for: .selected)
        btn.titleLabel!.font = UIFont(name: "Avenir Next", size: 26)
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        btn.addTarget(self, action: #selector(didTappedOnBackgroundView), for: UIControlEvents.touchUpInside)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        dialogView.addSubview(btn)
        
        let separatorLineView = UIView()
        separatorLineView.frame.origin = CGPoint(x: 0, y: titleLabel.frame.height + 40)
        separatorLineView.frame.size = CGSize(width: dialogViewWidth, height: 4)
        separatorLineView.backgroundColor = UIColor.groupTableViewBackground
        dialogView.addSubview(separatorLineView)
        
        dialogView.frame.origin = CGPoint(x: 32, y: frame.height)
        dialogView.frame.size = CGSize(width: frame.width-64, height: dialogViewHeight)
        
        dialogView.layer.borderWidth = 2
        dialogView.layer.borderColor = UIColor.white.cgColor
        addSubview(dialogView)
    }
    
    @objc func didTappedOnBackgroundView() {
        // Possible Animation
        print("TAPPED")
        dismiss(animated: true)
    }
    
    @objc func didTapYes() {
        dismiss(animated: true)
    }
    
    @objc func didTapNo() {
        dismiss(animated: true)
    }
    
}
