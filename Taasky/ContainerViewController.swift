//
//  ContainerViewController.swift
//  Taasky
//
//  Created by Aaron Bradley on 6/1/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, UIScrollViewDelegate {

  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var menuContainerView: UIView!
  private var detailViewController: DetailViewController?

  var menuItem: NSDictionary? {
    didSet {
      hideOrShowMenu(false, animated: true)
      if let detailViewController = detailViewController {
        detailViewController.menuItem = menuItem
      }
    }
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      hideOrShowMenu(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func hideOrShowMenu(show: Bool, animated: Bool) {
    let menuOffset = CGRectGetWidth(menuContainerView.bounds)
    scrollView.setContentOffset(show ? CGPointZero : CGPoint(x: menuOffset, y: 0), animated: animated)
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "DetailViewSegue" {
      let navigationController = segue.destinationViewController as! UINavigationController
      detailViewController = navigationController.topViewController as? DetailViewController
    }
  }

  // MARK: - UIScrollViewDelegate
  func scrollViewDidScroll(scrollView: UIScrollView) {
    // fix for UIScrollView paging issue
    scrollView.pagingEnabled = scrollView.contentOffset.x < (scrollView.contentSize.width - CGRectGetWidth(scrollView.frame))
  }


}
