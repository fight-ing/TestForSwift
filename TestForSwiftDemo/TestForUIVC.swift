//
//  TestForUIVC.swift
//  TestForSwiftDemo
//
//  Created by fei on 14-10-21.
//  Copyright (c) 2014年 self. All rights reserved.
//

import UIKit

class TestForUIVC: UIViewController,UIAlertViewDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource {
    
    override func viewWillAppear(animated: Bool) {
        println("will appear")
        self.navigationController?.navigationBar.translucent = false
    }
    override func awakeFromNib() {
        NSLog("xxx")
        let labelT = UILabel(frame: CGRectMake(10, 20, 300, 40))
        labelT.text = "This is a Label"
        labelT.backgroundColor = UIColor.purpleColor();
        labelT.textColor = UIColor(red: 0, green: 0.5, blue: 0.4, alpha: 1)
        self.view.addSubview(labelT)
        
        //通过xib自定义的UIView
        let nib = NSBundle.mainBundle()
        let array = nib.loadNibNamed("ttView", owner: self, options: nil) as Array
        
        let aaaa:ttView = array[0] as ttView
        aaaa.frame = CGRectMake(100, 0, 100, 100)
        aaaa.backgroundColor = UIColor.blueColor()
        self.view.addSubview(aaaa)

        let ttview = ttView(frame: CGRectMake(0, 40, 100, 300))
        ttview.backgroundColor = UIColor.redColor()
        self.view.addSubview(ttview)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "UI"
        
        println("self.view.frame :\(self.view.frame)")
        //self.view.frame :(0.0,0.0,375.0,667.0)   -6
        //self.view.frame :(0.0,0.0,414.0,736.0)   -plus
    
        
        
        let buttonT = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        buttonT.frame = CGRectMake(10, 70, 200, 40)
        buttonT.setTitle("button_type", forState: UIControlState.Normal)
        buttonT.backgroundColor = UIColor.blueColor()
        buttonT.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonT.tag = 100;
        self.view.addSubview(buttonT)
        
        
        let buttonT2 = UIButton(frame: CGRect(origin: CGPointMake(10, 120), size: CGSize(width: 200, height: 40)))
        buttonT2.setTitle("button_frame", forState: UIControlState.Normal)
        buttonT2.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        buttonT2.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonT2.tag = 101
        self.view.addSubview(buttonT2)
        
        let tapGes = UITapGestureRecognizer(target: self, action: "tapGesture:")
        
        let imageViewT = UIImageView(frame: CGRect(origin: CGPoint(x: 10, y: 180), size: CGSize(width: 200, height: 100)))
        imageViewT.userInteractionEnabled = true
        imageViewT.backgroundColor = UIColor.greenColor()
        imageViewT.image = UIImage(named: "lead_phone4_01")
        imageViewT.addGestureRecognizer(tapGes)
        let iString = NSBundle.mainBundle()
        self.view.addSubview(imageViewT)
        
        //UIScrollView
        var scrollViewT = UIScrollView(frame: CGRectMake(10, 300, self.view.frame.size.width-20, 300))
        scrollViewT.delegate = self;
        scrollViewT.contentSize = CGSize(width: 2000, height: 300)
        scrollViewT.pagingEnabled = true;
        for var i=0;i<4;i++ {
            let imageV = UIImageView(image: UIImage(named: "lead_phone4_0\(i+1)"))
            imageV.frame = CGRectMake(CGFloat(355*i), 0, 355, 300)
            imageV.userInteractionEnabled = true
            imageV.backgroundColor = UIColor.blueColor()
            scrollViewT.addSubview(imageV)
        }
//        self.view.addSubview(scrollViewT)
        
        //UITableView
        var tableViewT = UITableView(frame: CGRectMake(210, 60, 150, 220), style: UITableViewStyle.Plain)
        tableViewT.delegate = self;
        tableViewT.dataSource = self;
        tableViewT.backgroundColor = UIColor.lightGrayColor()
        tableViewT.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellName")
        self.view.addSubview(tableViewT)
        
//        let path =  [[NSBundle mainBundle] pathForResource:"lead_phone4_01" ofType:"png"];
        
//        println("imageSourcePath\(path)")
    }

/*
    ****** UITableView DataSource
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12;
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4;
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.contentView.backgroundColor = UIColor .lightGrayColor()
        let newTransform = CATransform3DMakeRotation(-CGFloat(M_PI_2), 1, 0, 0);
        cell.contentView.layer.anchorPoint = CGPointMake(0, 0);
        cell.contentView.layer.transform = newTransform;
        UIView.animateWithDuration(1.25, animations: {
            let newTransform = CATransform3DMakeRotation(0, 1, 0, 0);
            cell.contentView.layer.transform = newTransform
            })
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellName") as UITableViewCell
        if cell.isEqual(NSNull()) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cellName")
        }
        cell.textLabel?.text = "test cell :\(indexPath.section) ** \(indexPath.row)"
        return cell
    }
    
/*
    ****** UITableView delegate
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("didSelectAtIndexPath:\(indexPath)")
    }
    
/*
   ****** UIScrollView Delegate
    */
    func scrollViewDidScroll(scrollView: UIScrollView) {
//        println("scrollview did scroll")
    }
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        println("scrollView end dragging")
    }
    
    func tapGesture(tapGes:UITapGestureRecognizer!) {
        println("imageView tap gesture")
    }
    
    func buttonClicked(button:UIButton!) { //!意味着，button可以是由UIButton继承来的任意子类
        println("button clicked:button.tag=\(button.tag)")
        if button.tag==100 {
            let alertView = UIAlertView()
            alertView.title = "Alert"
            alertView.delegate = self;
            alertView.addButtonWithTitle("cancel")
            alertView.addButtonWithTitle("sure")
            alertView.message = "this is for alert test"
            alertView.show()
        }
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        println("alert clicked button :\(buttonIndex)")
        if buttonIndex==0 {
            alertView .dismissWithClickedButtonIndex(buttonIndex, animated: true)
        } else if buttonIndex == 1 {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
