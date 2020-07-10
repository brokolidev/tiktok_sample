//
//  ChatViewController.swift
//  Ticktok
//
//  Created by Hyunseung Choi on 2020/07/09.
//  Copyright © 2020 5s. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet weak var titleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.layer.cornerRadius = 10
        titleView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    
    private func close(){
        dismiss(animated: true, completion: nil)
    }

    @IBAction func closeModal(_ sender: Any) {
        close()
    }
    
    @IBAction func transparentBtn(_ sender: Any) {
        close()
    }
}
