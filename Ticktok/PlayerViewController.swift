//
//  PlayerViewController.swift
//  Ticktok
//
//  Created by Hyunseung Choi on 2020/07/06.
//  Copyright © 2020 5s. All rights reserved.
//

import UIKit
import AVKit

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerContainer: UIView!
    
    var videoURL:URL = URL(string: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_1MB.mp4")!
    var player:AVPlayer! // 영상 플레이어
    var isPlaying = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 비디오 로드
        self.player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: self.player)
        let vx = self.playerContainer.frame.size.width

        // 4:3 or 16:9
        let vx2 = ceil( vx * 9 / 16) + 5
        let vx3 = CGRect(x: self.playerContainer.frame.origin.x, y: self.playerContainer.frame.origin.y, width: self.playerContainer.frame.size.width, height: vx2)

        // disable autolayout
        self.playerContainer.translatesAutoresizingMaskIntoConstraints = true
        self.playerContainer.frame = vx3

        playerLayer.frame = self.playerContainer.bounds
        self.playerContainer.layer.addSublayer(playerLayer)
        
        // 자동 시작
        player.play()
    }
    
    @IBAction func togglePlay(_ sender: Any) {
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
    }
}
