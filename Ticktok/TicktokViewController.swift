//
//  ViewController.swift
//  Ticktok
//
//  Created by Hyunseung Choi on 2020/07/06.
//  Copyright © 2020 5s. All rights reserved.
//

import UIKit

class TicktokViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PlayerViewController") as? PlayerViewController
        self.addChild(vc!)
        self.view.addSubview(vc!.view)
    }


}

