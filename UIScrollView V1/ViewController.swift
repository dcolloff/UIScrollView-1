//
//  ViewController.swift
//  UIScrollView V1
//
//  Created by Dave on 5/15/17.
//  Copyright © 2017 Dave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!

    // create array for our image assets for the picker.
    var images = [UIImageView]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // creating and pasting our code from earlier into viewDidAppear, which will give us access to our frame data.
    override func viewDidAppear(_ animated: Bool) {
        
        print("Scrollview Width: \(scrollView.frame.size.width)")
        
        var contentWidth: CGFloat = 0.0
        
        // creating a scroll width constant so that we can use this below instead of constantly typing scrollView.frame.size.width

        let scrollWidth = scrollView.frame.size.width
        
        // create for loop which will cycle 3 times for our images in the picker
        for x in 0...2 {
            // put images in our array.  it's going to cycle through 3 times, and add the image according to the value of x in each loop - this is why we named our images that we're adding here "icon0.png", "icon1.png" and "icon2.png"
            let image = UIImage(named: "icon\(x).png")
            // create a reference to our imageView so we can set it's position later.  see session notes.
            let imageView = UIImageView(image: image)
            images.append(imageView)
            //* next, let's set position for our UIImageView element *//
            var newX: CGFloat = 0.0
            // updated our newX to be based off the size of our SCROLL VIEW not the VIEW itself.
            newX = scrollWidth / 2 + scrollView.frame.size.width * CGFloat(x)
            // adding the width of each UIImageView element to our "contentWidth" variable, which tells the scroll view how far to scroll.
            contentWidth += newX
            // add a sub view for each image, within our scroll view.
            scrollView.addSubview(imageView)
            // add a frame (basically a size constraint - right now our image view is an arbitrary size, because we haven't defined a size for it)
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        // this command makes it so that we can see the next/previous elements in the scroll view
        scrollView.clipsToBounds = false
        
        // setting the size of our scroll view's content view.  The width will be equal to our variable contentWidth, defined as the width of all elements, and the height will be the same size as the view itself, nothing off the screen vertically.
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


