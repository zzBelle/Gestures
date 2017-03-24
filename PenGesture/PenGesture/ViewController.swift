//
//  ViewController.swift
//  PenGesture
//
//  Created by 十月 on 17/3/13.
//  Copyright © 2017年 October. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var penView: UIView!
    var imageView: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImage()

        penView = UIView()
        penView.backgroundColor = .red
        penView.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        penView.layer.cornerRadius = 20
        self.view.addSubview(penView)
        let penGest = UIPanGestureRecognizer.init(target: self, action: #selector(penGester(sender:)))
        
        penView.addGestureRecognizer(penGest)
    }
    func penGester(sender:UIPanGestureRecognizer) {
        var point = sender.location(in: UIApplication.shared.keyWindow)
        switch sender.state {
        case .changed:
            penView.center = point
        case .ended:
            if point.x > UIScreen.main.bounds.size.width / 2.0 {
                point.x = UIScreen.main.bounds.size.width - (penView.frame.size.width / 2.0)
            }else{
             point.x = penView.frame.size.width / 2.0
            }
            
            UIView.animate(withDuration: 0.3, animations: { 
                self.penView.center = point
            })
        default:
            print("")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

