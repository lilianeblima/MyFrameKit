//
//  ViewController.swift
//  MyFramework
//
//  Created by Liliane Lima on 10/07/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import UIKit
import MyFrameKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myKit = Authentication()
        myKit.requestToken(clientSecret: "", clientId: "") { (token) in
            print(token ?? "")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

