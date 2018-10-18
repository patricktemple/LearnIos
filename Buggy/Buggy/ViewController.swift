//
//  ViewController.swift
//  Buggy
//
//  Created by Patrick Temple on 10/17/18.
//  Copyright © 2018 Patrick Temple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Method: \(#function) in \(#file) line: \(#line) called.")

        badMethod()
    }

    func badMethod() {
        let array = NSMutableArray()

        for i in 0..<10 {
            array.insert(i, at: i)
        }

        for _ in 0...10 {
            array.remove(0)
        }
    }
}

