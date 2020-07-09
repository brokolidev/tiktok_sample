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
    @IBOutlet weak var playImage: UIImageView!
        
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
        
        // 플레이 버튼 숨기기
        playImage.isHidden = true

        playerLayer.frame = self.playerContainer.bounds
        self.playerContainer.layer.addSublayer(playerLayer)
        
        // 자동 시작
        player.play()
        
        // 자동 반복 설정
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player.currentItem, queue: .main) { [weak self] _ in
            self?.player?.seek(to: CMTime.zero)
            self?.player?.play()
        }
    }
    
//    private func overlayPlayBtn() {
//
//        let buttonLayer = CALayer()
//        buttonLayer.frame = playerContainer.bounds
//        buttonLayer.contents = playImage
//        buttonLayer.contentsGravity = .center
//        buttonLayer.magnificationFilter = .linear
//
//        playerContainer.layer.addSublayer(buttonLayer)
//
//    }
    
    @IBAction func toggleChatting(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    @IBAction func shareVideo(_ sender: Any) {
        print("share video")
    }
    
    @IBAction func togglePlay(_ sender: Any) {
        if isPlaying {
            player.pause()
            playImage.isHidden = false
        } else {
            player.play()
            playImage.isHidden = true
        }
        isPlaying.toggle()
    }
}
