//
//  CardsViewController.swift
//  TinderApp
//
//  Created by Hung Do on 4/5/17.
//  Copyright © 2017 Hung Do. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var pictureView: UIImageView!
    var trayOriginalCenter: CGPoint!


    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        
        
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
            trayOriginalCenter = pictureView.center

        } else if sender.state == .changed {
            print("Gesture is changing")
            
            if (translation.x < 0) {
                
                UIView.animate(withDuration: 0.3, animations: {
                    let xRadians = CGFloat( -50 * M_PI / 180)
                    self.pictureView.transform = CGAffineTransform(rotationAngle: xRadians)
                }) { (Bool) in
                    if(translation.x > 50) {
                        self.pictureView.center.x += 320
                        
                    }                }
                
 
                
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    let xRadians = CGFloat( -50 * M_PI / 180)
                    self.pictureView.transform = CGAffineTransform(rotationAngle: xRadians)
                }) { (Bool) in
                    if(translation.x > -50) {
                        self.pictureView.center.x += -320
                        
                    }                }
            }
            


        } else if sender.state == .ended {
            print("Gesture ended")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
