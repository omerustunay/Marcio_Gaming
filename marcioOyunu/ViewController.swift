//
//  ViewController.swift
//  marcioOyunu
//
//  Created by MacOS on 2.02.2019.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblMax: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    var myNumber = 0;
    var count = 0;
    var timer = Timer();
    var marcioArray = [UIImageView]();
    var timerYedek = Timer();
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let highScore = UserDefaults.standard.object(forKey: "maxScore");
        
        if highScore == nil {
            lblMax.text = "0"
        }
        if let newNumber = highScore as? Int{
            lblMax.text = String(newNumber);
        }
        
        count = 30;
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.time), userInfo: nil, repeats: true)
        
        timerYedek = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.loop), userInfo: nil, repeats: true)
        
        image1.isUserInteractionEnabled = true
        image2.isUserInteractionEnabled = true
        image3.isUserInteractionEnabled = true
        image4.isUserInteractionEnabled = true
        image5.isUserInteractionEnabled = true
        image6.isUserInteractionEnabled = true
        image7.isUserInteractionEnabled = true
        image8.isUserInteractionEnabled = true
        image9.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.score))
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.score))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.score))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.score))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.score))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.score))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.score))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.score))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.score))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.score))
        image1.addGestureRecognizer(gestureRecognizer)
        image2.addGestureRecognizer(gestureRecognizer1)
        image3.addGestureRecognizer(gestureRecognizer2)
        image4.addGestureRecognizer(gestureRecognizer3)
        image5.addGestureRecognizer(gestureRecognizer4)
        image6.addGestureRecognizer(gestureRecognizer5)
        image7.addGestureRecognizer(gestureRecognizer6)
        image8.addGestureRecognizer(gestureRecognizer7)
        image9.addGestureRecognizer(gestureRecognizer8)
       
        
        marcioArray.append(image1)
        marcioArray.append(image2)
        marcioArray.append(image3)
        marcioArray.append(image4)
        marcioArray.append(image5)
        marcioArray.append(image6)
        marcioArray.append(image7)
        marcioArray.append(image8)
        marcioArray.append(image9)
        loop();
    }

    @objc func score(){
        myNumber = myNumber + 1;
        lblScore.text = "Score: \(myNumber)"
    }
    
    @objc func time(){
        count = count - 1;
        lblTime.text = String(count);
        if count == 0 {
            timer.invalidate();
            timerYedek.invalidate();
            
            
            if self.myNumber > Int(lblMax.text!)!{
                UserDefaults.standard.set(self.myNumber,forKey: "maxScore");
                lblMax.text = String(self.myNumber);
            }
            
            
            let alert = UIAlertController(title: "süre bitti!!", message: "tekrar oynamak ister misiniz?", preferredStyle: UIAlertController.Style.alert)
            let button = UIAlertAction(title: "iptal", style: UIAlertAction.Style.default, handler: nil)
            let button1 = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: {(UIAlertAction) in
                
                self.myNumber = 0;
                self.lblScore.text = "Score: \(self.myNumber)";
                self.count = 30;
                self.lblTime.text = "\(self.count)";
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.time), userInfo: nil, repeats: true)
                self.timerYedek = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.loop), userInfo: nil, repeats: true);
                
            })
            alert.addAction(button);
            alert.addAction(button1);
            
            
            self.present(alert,animated: true, completion: nil)

        }
    }
    @objc func loop(){
        
        for marcio in marcioArray{
            marcio.isHidden = true;
        }
        let random = Int(arc4random_uniform(UInt32(marcioArray.count-1)))
       
        marcioArray[random].isHidden = false;
    }
}

