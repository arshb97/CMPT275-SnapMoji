//
//  ToggleButton.swift
//  SnapMoji
//
//  Created by zza92 on 2018-11-08.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit

class ToggleButton: UIButton {
    var isOn=false
    override init(frame: CGRect){
        super.init(frame: frame)
        initButton()
        
    }
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        initButton()
    }
    func initButton(){
        layer.borderWidth = 1.0
        //layer.borderColor = UIColor .black


        addTarget(self, action: #selector(AFollowButton.ButtonPressed), for: .touchUpInside)
    }
    
    func ButtonPressed(){
        ActivateButton(bool: !isOn)
    }
    func ActivateButton(bool: Bool){
        isOn = bool
        let titlecolor=bool ? UIColor .blue : UIColor .white
        let color = bool ? UIColor .white : .clear
        
        setTitleColor(titlecolor, for: .normal)
        backgroundColor=color
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
