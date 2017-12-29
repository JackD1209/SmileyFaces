//
//  SmileyFacesViewController.swift
//  SmileyFaces
//
//  Created by Đoàn Minh Hoàng on 12/29/17.
//  Copyright © 2017 Đoàn Minh Hoàng. All rights reserved.
//

import UIKit

class SmileyFacesViewController: UIViewController {
    
    @IBOutlet weak var trayView: UIView!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var excitedImage: UIImageView!
    @IBOutlet weak var happyImage: UIImageView!
    @IBOutlet weak var deadImage: UIImageView!
    @IBOutlet weak var winkImage: UIImageView!
    @IBOutlet weak var tongueImage: UIImageView!
    @IBOutlet weak var sadImage: UIImageView!
    
    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImage()
        trayDownOffset = 196
        trayUp = CGPoint(x: 0 ,y: view.frame.height - trayView.frame.height)
        trayDown = CGPoint(x: 0 ,y: view.frame.height - trayView.frame.height + trayDownOffset)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpImage() {
        [excitedImage, happyImage, deadImage, winkImage, tongueImage, sadImage].forEach { (imageView) in
            imageView?.image = imageView?.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            imageView?.tintColor = UIColor(red: 240/255, green: 205/255, blue: 48/255, alpha: 0.5)
        }
    }
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if sender.state == .began {
            trayOriginalCenter = CGPoint(x: 0, y: trayView.frame.origin.y)
        } else if sender.state == .changed {
            trayView.frame.origin.x = 0
            trayView.frame.origin.y = trayOriginalCenter.y + translation.y
            UIView.animate(withDuration: 0.5, animations: {
                self.arrowImage.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
            })
        } else if sender.state == .ended {
            let velocity = sender.velocity(in: view)
            
            if velocity.y > 0 {
                UIView.animate(withDuration: 0.3) {
                    self.trayView.frame.origin.x = self.trayDown.x
                    self.trayView.frame.origin.y = self.trayDown.y
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.trayView.frame.origin.x = self.trayUp.x
                    self.trayView.frame.origin.y = self.trayUp.y
                }
            }
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
