//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation //오디오 하드웨어와 상호작용할수 있는 라이브러리.

class ViewController: UIViewController {
    
    var player: AVAudioPlayer? //AVAudioPlayer 사운드를 재생하는데 사용하는것.
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func KeyPressed(_ sender: UIButton) {
       
        playSound()
    }
    
    // 핑크색 같은 경우는 프로그래밍 개념이지만, 보라색 글자 같은 경우는 애플 API의 내용이므로, api를 보는 습관을 들여야한다. 
    func playSound() {
        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return } //Bundle은 무엇인가.사운드 파일 리소스를 찾는 것
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
           
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}

