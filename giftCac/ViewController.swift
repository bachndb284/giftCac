//
//  ViewController.swift
//  giftCac
//
//  Created by Nguyen Bach on 2/15/17.
//  Copyright © 2017 Nguyen Bach. All rights reserved.
//

import UIKit
import pop
class ViewController: UIViewController {

    @IBOutlet weak var shadow: UIImageView!
    @IBOutlet var base: UIImageView!
    @IBOutlet var line: UIImageView!
    @IBOutlet var alphaView: UIImageView!
    @IBOutlet var topthings: UIImageView!
    @IBOutlet var priceLabel: UIImageView!
    @IBOutlet var forcurves: UIImageView!
    @IBOutlet var wave1: UIImageView!
    @IBOutlet var wave2: UIImageView!
    @IBOutlet var container: UIView!
    @IBOutlet var l1: UIImageView!
    @IBOutlet var l2: UIImageView!
    @IBOutlet var l3: UIImageView!
    @IBOutlet var l4: UIImageView!
    @IBOutlet var l5: UIImageView!
    @IBOutlet var button: UIButton!
    @IBOutlet var forMotion: UIImageView!
    @IBOutlet weak var kuang: UIImageView!
    @IBOutlet weak var checkOutButton: UIButton!
    
    var imageArray = [UIImage]()
    typealias myBlock = (_: Int, _: Int) -> Int
    override func viewDidLoad() {
        super.viewDidLoad()
        self.base.addSubview(self.line)
        self.base.addSubview(self.forMotion)
        self.forMotion.addSubview(self.alphaView)
        self.alphaView.addSubview(self.topthings)
        self.alphaView.clipsToBounds = true
        
        self.forMotion.addSubview(self.priceLabel)
        self.forMotion.addSubview(self.l1)
        self.forMotion.addSubview(self.l2)
        self.forMotion.addSubview(self.l3)
        self.forMotion.addSubview(self.l4)
        self.forMotion.addSubview(self.l5)
        self.forMotion.addSubview(self.kuang)
        self.forMotion.clipsToBounds = true
        
        self.forMotion.addSubview(self.checkOutButton)
        self.forMotion.addSubview(self.button)
        self.base.isUserInteractionEnabled  = true
        self.forMotion.isUserInteractionEnabled = true
        self.checkOutButton.isUserInteractionEnabled = true
        self.button.isUserInteractionEnabled = true
        self.container.isUserInteractionEnabled = true
        self.topthings.addSubview(self.forcurves)
        self.forcurves.addSubview(self.wave1)
        self.forcurves.addSubview(self.wave2)
        self.forcurves.clipsToBounds = true
        
        UIView.animateKeyframes(withDuration: 15, delay: 0, options: .repeat, animations:{()->Void in
            var waveCenter1: CGPoint = self.wave1.center
            waveCenter1.x -= 569
            self.wave1.center = waveCenter1
        }, completion: {
            (_finish: Bool) -> Void in
        })
        
        UIView.animateKeyframes(withDuration: 15, delay: 0, options: .repeat, animations: {()->Void in
            var waveCenter2: CGPoint = self.wave2.center
            waveCenter2.x += 569
            self.wave2.center = waveCenter2
        }, completion: {
            (_finish: Bool) -> Void in
        })
        
        for i in 11...39{
           
            var image = UIImage(named: "giftbutton000%0d.jpg")
            imageArray.append(image!)
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func buyButtonPressed(_ sender: Any) {
        self.button.isUserInteractionEnabled = false
        var btndown = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        btndown?.fromValue = NSValue(cgSize: CGSize(width: 1, height: 1))
        btndown?.toValue = NSValue(cgSize: CGSize(width: 0.85, height: 0.85))
        btndown?.springBounciness = 5
        btndown?.springSpeed = 10
        self.button.pop_add(btndown, forKey: "btndown")
        btndown?.completionBlock = {(_ anim: POPAnimation?
            , _ finished: Bool) -> Void in
            var btnup = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            btnup?.fromValue = NSValue(cgSize: CGSize(width: 0.86, height: 0.86))
            btnup?.toValue = NSValue(cgSize: CGSize(width: 1, height: 1))
            btnup?.springBounciness = 5
            btnup?.springSpeed = 10
            self.button.pop_add(btnup, forKey: "btnup")
            btnup?.completionBlock = {(_aim: POPAnimation?, _finished: Bool) ->Void in
                var imageView = UIImageView(frame: self.button.frame)
                self.view.addSubview(imageView)
                imageView.image = self.imageArray[self.imageArray.count - 1]
                imageView.animationImages = self.imageArray
                imageView.animationDuration = 1.0
                imageView.animationRepeatCount = 1
                imageView.startAnimating()
                UIView.transition(from: self.button, to: imageView, duration: 0.5, options: UIViewAnimationOptions.beginFromCurrentState , completion: { (finished: Bool) ->Void in
                   let deadlineTime = DispatchTime.now() + DispatchTimeInterval.seconds(1)
                   DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
                    () -> Void in
                    var tops = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
                    tops?.beginTime = CACurrentMediaTime() + 0.1
                    tops?.toValue = NSValue(cgSize: CGSize(width: 0.89, height: 0.89))
                    tops?.springBounciness = 0
                    tops?.springSpeed = 2
                    self.topthings.pop_add(tops, forKey: "tops")
                    
                    var topy = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
                    topy?.beginTime = CACurrentMediaTime() + 0.1
                    topy?.toValue = 240
                    topy?.springBounciness = 0
                    topy?.springSpeed = 2
                    self.topthings.pop_add(topy, forKey: "topy")
                    
                    var center: CGPoint = imageView.center
                    imageView.center = center
                    var giftx = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
                    giftx?.beginTime = CACurrentMediaTime() + 0.1
                    giftx?.toValue = (center.x -= 246)
                    giftx?.springBounciness = 0
                    giftx?.springSpeed = 2
                    imageView.pop_add(giftx, forKey: "giftx")
                    
                    var center2: CGPoint = self.priceLabel.center
                    self.priceLabel.center = center2
                    var plx = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
                    plx?.beginTime = CACurrentMediaTime() + 0.1
                    plx?.toValue = (center2.x -= 246)
                    plx?.springBounciness = 0
                    plx?.springSpeed = 2
                    self.priceLabel.pop_add(plx, forKey: "plx")
                    
                    var center3: CGPoint = self.kuang.center
                    self.kuang.center = center3
                    var center31: CGPoint = self.checkOutButton.center
                    self.checkOutButton.center = center31
                    var ipx = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
                    ipx?.beginTime = CACurrentMediaTime() + 0.1
                    ipx?.toValue = (center3.x -= 277)
                    ipx?.springBounciness = 0
                    ipx?.springSpeed = 2
                    self.kuang.pop_add(ipx, forKey: "ipx")
                    var ipx2 = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
                    ipx2?.beginTime = CACurrentMediaTime() + 0.1
                    ipx2?.toValue = (center31.x -= 277)
                    ipx2?.springBounciness = 0
                    ipx2?.springSpeed = 2
                    self.checkOutButton.pop_add(ipx2, forKey: "ipx2")
                    
                    var centerl1: CGPoint = self.l1.center
                    self.l1.center = centerl1
                    
                    var centerl2: CGPoint = self.l2.center
                    self.l2.center = centerl2
                    
                    var centerl3: CGPoint = self.l3.center
                    self.l3.center = centerl3
                    
                    var centerl4: CGPoint = self.l4.center
                    self.l4.center = centerl4
                    
                    var centerl5: CGPoint = self.l5.center
                    self.l5.center = centerl5
                    
                    var lx1 = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
                    lx1?.beginTime = CACurrentMediaTime() + 0
                    lx1?.toValue = (centerl1.x -= 357)
                    lx1?.springBounciness = 0
                    lx1?.springSpeed = 2
                    self.l1.pop_add(lx1, forKey: "lx1")
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                        () -> Void in
                        self.l1.alpha = 1
                    }, completion: { (_finished: Bool) -> Void in
                    })
                    
                    var lx2 = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
                    lx2?.beginTime = CACurrentMediaTime() + 0.05
                    lx2?.toValue = (centerl2.x -= 357)
                    lx2?.springBounciness = 0
                    lx2?.springSpeed = 2
                    self.l2.pop_add(lx2, forKey: "lx2")
                    UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut, animations: {
                        () -> Void in
                        self.l2.alpha = 1
                    }, completion: { (_finished: Bool) -> Void in
                    })
                    
                    var lx3 = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
                    lx3?.beginTime = CACurrentMediaTime() + 0.1
                    lx3?.toValue = (centerl3.x -= 357)
                    lx3?.springBounciness = 0
                    lx3?.springSpeed = 2
                    self.l3.pop_add(lx3, forKey: "lx3")
                    UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
                        () -> Void in
                        self.l3.alpha = 1
                    }, completion: { (_finished: Bool) -> Void in
                    })
                    
                    var lx4 = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
                    lx4?.beginTime = CACurrentMediaTime() + 0.15
                    lx4?.toValue = (centerl4.x -= 357)
                    lx4?.springBounciness = 0
                    lx4?.springSpeed = 2
                    self.l4.pop_add(lx4, forKey: "lx4")
                    UIView.animate(withDuration: 0.5, delay: 0.15, options: .curveEaseInOut, animations: {
                        () -> Void in
                        self.l4.alpha = 1
                    }, completion: { (_finished: Bool) ->Void in
                    })
                    
                    var lx5 = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
                    lx5?.beginTime = CACurrentMediaTime() + 0.2
                    lx5?.toValue = (centerl5.x -= 357)
                    lx5?.springBounciness = 0
                    lx5?.springSpeed = 2
                    self.l5.pop_add(lx5, forKey: "lx5")
                    UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseInOut, animations: {
                        () -> Void in
                        self.l5.alpha = 1
                    }, completion: { (_finished: Bool) in
                    })
                    
                   })
                })
            }
        }
        
    }
    
    @IBAction func checkPressed(_ sender: Any) {
        self.checkOutButton.isUserInteractionEnabled = false
        var cbtndown = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        cbtndown?.fromValue = NSValue(cgSize: CGSize(width: 1, height: 1))
        cbtndown?.toValue = NSValue(cgSize: CGSize(width: 0.85, height: 0.85))
        cbtndown?.springBounciness = 5
        cbtndown?.springSpeed = 10
        self.checkOutButton.pop_add(cbtndown, forKey: "cbtndown")
        cbtndown?.completionBlock =  {(_aim: POPAnimation?, _finished: Bool) ->Void in
            var cbtnup = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            cbtnup?.fromValue = NSValue(cgSize: CGSize(width: 0.85, height: 0.85))
            cbtnup?.toValue = NSValue(cgSize: CGSize(width: 1, height: 1))
            cbtnup?.springBounciness = 5
            cbtnup?.springSpeed = 10
            self.checkOutButton.pop_add(cbtnup, forKey: "cbtnup")
            cbtnup?.completionBlock = {(_aim: POPAnimation?, _finished: Bool) ->Void in
                var carda = UIImageView(frame: self.base.frame)
                var image = UIImage(named: "Card A.jpg")
                carda.image = image
                carda.tag  = 101
                carda.alpha = 1
                self.container.addSubview(carda)
                self.base.tag = 100
                self.base = UIImageView(frame: self.container.bounds)
                carda = UIImageView(frame: self.container.bounds)
                self.container.addSubview(self.base)
                
                UIView.transition(from: self.base, to: carda, duration: 0.6, options: UIViewAnimationOptions.transitionFlipFromBottom, completion: { (_finished: Bool) -> Void in
                })
            }
        
        }
            
        
        }
        
        
        
        
    
    


}

