//
//  ContainerViewController.swift
//  Taasky
//
//  Created by Aaron Bradley on 6/1/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

  private var detailViewController: DetailViewController?

  var menuItem: NSDictionary? {
    didSet {
      if let detailViewController = detailViewController {
        detailViewController.menuItem = menuItem
      }
    }
  }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "DetailViewSegue" {
      let navigationController = segue.destinationViewController as! UINavigationController
      detailViewController = navigationController.topViewController as? DetailViewController
    }
  }


}
