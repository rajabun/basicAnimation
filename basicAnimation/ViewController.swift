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
    var currentAnimation = 0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //#2. Buat Button jadi Bundar
        myObject.layer.cornerRadius = myObject.frame.width/2
        
        //myObjectTransform.layer.cornerRadius = myObjectTransform.frame.width/2
        
        print(myObject.frame)
    }
    
    //#3. Deklarasi Action Button + Masukin Animasi
    @IBAction func actionButton(_ sender: UIButton)
    {
        //kalau hanya seperti ini, satu fungsi hanya bisa menjalankan satu animasi saja. kalau dimasukin dua, jadinya langsung animasi yang terakhir ditulis (kedua) yang dijalankan
       
        UIView.animate(withDuration: 1)
        {
            self.myObject.frame = CGRect(x: 23, y: 100, width: 100, height: 100)
            print(self.myObject.frame)
        }
        
        //kalau seperti ini tetap hanya satu animasi yang berjalan yaitu animasi terakhir
        /*
            UIView.animate(withDuration: 1)
            {
                self.myObject.frame = CGRect(x: 20, y: 155, width: 100, height: 100)
                UIView.animate(withDuration: 5)
                {
                    self.myObject.frame = CGRect(x: 20, y: 290, width: 100, height: 100)
                }
            }
        */
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
            self.myObjectAlpha.alpha = CGFloat(bitPattern: UInt(0.1))
            print(self.myObjectAlpha.alpha)
        }
    }
    
    @IBAction func backgroundColorButton(_ sender: UIButton)
    {
        //fungsi ini untuk menjalankan dua atau lebih animasi dalam satu button secara berurutan
        //jika dibikin switch-case seperti ini, setiap diklik sekali, bisa memainkan satu animasi yang berbeda sesuai casenya.
        UIView.animate(withDuration: 1, delay: 0, options: [], animations:
            {
                switch self.currentAnimation
                {
                    case 0:
                        self.myObjectBackgroundColor.backgroundColor = .red
                        self.view.backgroundColor = .black
                    
                    case 1:
                        self.myObjectBackgroundColor.backgroundColor = .blue
                    
                    case 2:
                        self.myObjectBackgroundColor.backgroundColor = .yellow
                    
                    case 3:
                        self.myObjectBackgroundColor.backgroundColor = .green
                    
                    case 4:
                        self.myObjectBackgroundColor.backgroundColor = .purple
                    
                    case 5:
                        self.myObjectBackgroundColor.backgroundColor = .black
                    
                    case 6:
                        self.myObjectBackgroundColor.backgroundColor = .white
                    
                    case 7:
                        self.myObjectBackgroundColor.backgroundColor = .orange
                
                    default:
                    break
                }
            })
        
        currentAnimation += 1
        
        if currentAnimation > 7
        {
            currentAnimation = 0
        }
    }
    
    @IBAction func transformButton(_ sender: UIButton)
    {/*
        UIView.animate(withDuration: 1)
        {
            //self.myObjectTransform.transform = CGAffineTransform(rotationAngle: 45)
            self.myObjectTransform.transform = CGAffineTransform(scaleX: 2, y: 2)
            //self.myObjectTransform.transform = CGAffineTransform(translationX: 40, y: 60)
            print(self.myObjectTransform.transform)
        }
      */
        //fungsi ini untuk menjalankan dua animasi secara bergantian. animasi kedua dimulai setelah animasi pertama dijalankan, jadi tidak dari tempat awal animasi pertama dimulai. selalu gunakan nested untuk menjalankan lebih dari satu animasi dan satu fungsi animate hanya untuk satu animasi. jika ingin membuat tiga animasi, bikin fungsi animatenya jadi tiga.
        
        UIView.animate(withDuration: 1, delay: 0.5, options: [], animations:
            {
                self.myObjectTransform.frame = CGRect(x: 294, y: 700, width: 100, height: 100)
                //self.myObjectTransform.transform = CGAffineTransform(scaleX: 5, y: 5)
                //self.myObjectTransform.transform = CGAffineTransform(translationX: 40, y: 60)
            }, completion:
                { finish in //Tanpa closure finish in, akan error : Cannot convert value of type '() -> Void' to expected argument type '((Bool) -> Void)?'
                    UIView.animate(withDuration: 1, delay: 0.5, options: [], animations:
                        {
                            self.myObjectTransform.frame = CGRect(x: 157, y: 700, width: 100, height: 100)
                            //self.myObjectTransform.transform = CGAffineTransform(scaleX: 2, y: 2)
                            //self.myObjectTransform.isEnabled = false
                        }, completion:
                            { finish in
                                UIView.animate(withDuration: 1, delay: 0.5, options: [], animations:
                                    {
                                        self.myObjectTransform.transform = CGAffineTransform(scaleX: 2, y: 2)
                                    }, completion:
                                        { finish in
                                            UIView.animate(withDuration: 1, delay: 0.5, options: [], animations:
                                                {
                                                    self.myObjectTransform.transform = CGAffineTransform(rotationAngle: 45)
                                                }, completion:
                                                    { finish in
                                                        UIView.animate(withDuration: 3, delay: 2, options: [], animations:
                                                            {
                                                                UIView.setAnimationBeginsFromCurrentState(false)
                                                                self.myObjectTransform.transform = CGAffineTransform(translationX: -50, y: -50)
                                                            }, completion: nil)
                                                    })
                                        })
                            })
                })
    }
  
}

