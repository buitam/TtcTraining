//
//  MessagePageView.swift
//  TTCTraining
//
//  Created by Apple on 10/31/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MessagePageView: UIPageViewController {
    lazy var subviewControllers:[UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "DiscussionsVC"),UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "BanBeVC")]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([subviewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    
    func didChangePage(_ page:Int) {
        setViewControllers([subviewControllers[page]], direction: .forward, animated: true, completion: nil)
    }
}
