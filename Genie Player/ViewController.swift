//
//  ViewController.swift
//  Genie Player
//
//  Created by Kiwoong Jang on 10/9/15.
//  Copyright © 2015 Kiwoong Jang. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

	@IBOutlet weak var webView: WebView!;
	
    override func viewDidLoad() {
		super.viewDidLoad();

        let urlString = "http://www.genie.co.kr/MusicPlayer/f_MusicPlayer.asp";
		self.webView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: urlString)!));
    }

    override var representedObject: AnyObject? {
        didSet {
//			print("changed");
        }
    }
	
	func webView(sender: WebView!, contextMenuItemsForElement element: [NSObject : AnyObject]!, defaultMenuItems: [AnyObject]!) -> [AnyObject]! {
		return [];
	}
	
	func webView(sender: WebView!, didStartProvisionalLoadForFrame frame: WebFrame!) {
//		print("loading!");
	}
	
	func webView(sender: WebView!, didFinishLoadForFrame frame: WebFrame!) {
//		print("finished!");
	}
	
	func webView(sender: WebView!, didReceiveTitle title: String!, forFrame frame: WebFrame!) {
		if title.rangeOfString("- 지니") != nil {
			let notification = NSUserNotification();
			notification.title = "Genie Player";
			notification.informativeText = title.stringByReplacingOccurrencesOfString("- 지니", withString: "");
		
			NSUserNotificationCenter.defaultUserNotificationCenter().deliverNotification(notification);
		}
	}
	
}