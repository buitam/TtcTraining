//
//  MessViewController.swift
//  TTCTraining
//
//  Created by Bui Tam on 9/19/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class MessViewController: UIViewController{
    
    static var index:Int = 0
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var controller: MessagePageView?
    @IBAction func segment(_ sender: Any) {
        controller?.didChangePage(segmentControl.selectedSegmentIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = storyboard!.instantiateViewController(withIdentifier: "MessagePageView") as! MessagePageView
        addChild(controller!)
        contentView.addSubview(controller!.view)
        controller!.didMove(toParent: self)
        
    }
}

