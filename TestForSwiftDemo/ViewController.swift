//
//  ViewController.swift
//  TestForSwiftDemo
//
//  Created by fei on 14-10-20.
//  Copyright (c) 2014年 self. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var a = "reuseCell"
        self.title = "hahhahaha"
        self.createMemeberVariable();
        
        
        
     
        var imageView:UIImageView = UIImageView(frame: CGRectMake(0, self.view.frame.size.height-100, 50, 50))
        imageView.backgroundColor = UIColor.lightGrayColor()
        imageView.image = UIImage (named: "test")
        self.view.addSubview(imageView)
        
        var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton;
        button.frame = CGRectMake(100, self.view.frame.size.height-100, 200, 50)
        button.backgroundColor = UIColor.lightGrayColor()
//        button.backgroundImageForState(UIControlState.Highlighted) as UIImage = UIImage.animatedImageNamed("test.png", duration: 0)
        button.titleLabel?.text = "test button"
        button.setTitle("test button", forState: UIControlState.Normal)
        button.addTarget(self, action:"buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func buttonClicked(button:UIButton) ->Void {
        println("button Clicked")
        
//        let test = TestForUIVC(nibName: "TestForUIVC", bundle: nil)
//        println("test -- \(test)")
        let UIVC = TestForUIVC()
        let mainstorybard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let ttVC = mainstorybard.instantiateViewControllerWithIdentifier("TestForUIVC") as UIViewController
        self.navigationController?.pushViewController(ttVC, animated: true)
    }
    func createMemeberVariable() ->Void{
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "right", style: UIBarButtonItemStyle.Bordered, target: self, action: "rightButtonClicked:");
        
    }
    
    func rightButtonClicked(buttonItem:UIBarButtonItem) {
        println("right button clicked")
    }
/*
    UITableView dataSource
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8;
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3;
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("select at :\(indexPath)")
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("reuseCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = "section:\(indexPath.section)-row:\(indexPath.row)"
        return cell;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

