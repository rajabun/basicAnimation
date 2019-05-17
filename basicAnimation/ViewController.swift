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

}

