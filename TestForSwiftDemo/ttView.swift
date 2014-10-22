//
//  ttView.swift
//  TestForSwiftDemo
//
//  Created by fei on 14-10-21.
//  Copyright (c) 2014年 self. All rights reserved.
//

import UIKit

class ttView: UIView {

    @IBOutlet var ttButton: UIButton!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        //
        println("awakefromnib");
        self.addSubview(ttButton);
    }

}
