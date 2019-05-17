//
//  ViewController.swift
//  basicAnimation
//
//  Created by Muhammad Rajab Priharsanto on 17/05/19.
//  Copyright © 2019 Muhammad Rajab Priharsanto. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    //#1. Deklarasi Button
    @IBOutlet weak var myObject: UIButton!
    @IBOutlet weak var myObjectBounds: UIButton!
    @IBOutlet weak var myObjectCenter: UIButton!
    @IBOutlet weak var myObjectAlpha: UIButton!
    @IBOutlet weak var myObjectBackgroundColor: UIButton!
    @IBOutlet weak var myObjectTransform: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //#2. Buat Button jadi Bundar
        myObject.layer.cornerRadius = myObject.frame.width/2
        
        print(myObject.frame)
    }
    
    //#3. Deklarasi Action Button + Masukin Animasi
    @IBAction func actionButton(_ sender: UIButton)
    {
        UIView.animate(withDuration: 1)
        {
            self.myObject.frame = CGRect(x: 23, y: 100, width: 100, height: 100)
            print(self.myObject.frame)
            /*
            UIView.animate(withDuration: 1)
            {
                self.myObject.transform = CGAffineTransform(scaleX: 5, y: 5)
                UIView.animate(withDuration: 1)
                {
                    self.myObject.transform = CGAffineTransform(translationX: 100, y: 100)
                }
            }
             */
        }
    }

    @IBAction func boundsButton(_ sender: UIButton)
    {
        UIView.animate(withDuration: 1)
        {
            self.myObjectBounds.bounds = CGRect(x: 23, y: 100, width: 100, height: 100)
            print(self.myObjectBounds.bounds)
        }
    }
    
    @IBAction func centerButton(_ sender: UIButton)
    {
        UIView.animate(withDuration: 1)
        {
            self.myObjectCenter.center = CGPoint(x: 50, y: 50)
            print(self.myObjectCenter.center)
        }
    }
    
    @IBAction func alphaButton(_ sender: UIButton)
    {
        UIView.animate(withDuration: 1)
        {
            self.myObjectAlpha.alpha = CGFloat(bitPattern: UInt(0.5))
            print(self.myObjectAlpha.alpha)
        }
    }
    
    @IBAction func backgroundColorButton(_ sender: UIButton)
    {
        UIView.animate(withDuration: 1)
        {
            self.myObjectBackgroundColor.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            self.view.backgroundColor = .black
        }
    }
    
    @IBAction func transformButton(_ sender: UIButton)
    {
        UIView.animate(withDuration: 1)
        {
            self.myObjectTransform.transform = CGAffineTransform(rotationAngle: 45)
            self.myObjectTransform.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.myObjectTransform.transform = CGAffineTransform(translationX: 40, y: 60)
            
        }
    }
  
}

