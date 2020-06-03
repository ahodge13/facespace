//
//  ViewController.swift
//  FaceSpace22
//
//  Created by Jonavon Smith on 5/10/20.
//  Copyright © 2020 FaceSpaceInc. All rights reserved.
//
import Foundation
import AVFoundation
import UIKit
import Firebase
import AVKit


class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Set up video in the background
        setUpVideo()
        
    }
    
    func setUpVideo() {
        
        // Get the path to resource in bundle
        let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
        
        // Create a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        guard bundlePath != nil else {
            return
        }
        
        //
        
        // create video player item
        let item = AVPlayerItem(url: url)
        
        // create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        // create layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        // adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // add item to view and play it
        videoPlayer?.playImmediately(atRate: 0.8)
        
        
        
    }
    
}
  

