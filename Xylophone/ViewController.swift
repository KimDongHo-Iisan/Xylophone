import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound()
    }
    
    func playSound() {
        //url을 C.wav 파일의 위치로 설정
        let url = Bundle.main.url(forResource: "C", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!) //파일을 player에 넣음
        player.play() //소리를 재생해라.
        //전화기가 무음 모드가 켜져있을때 소리가 나오도록 하는 부분을 제거했기 때문에 무음모드일때는 소리가 나지않는다. 
                
    }
}
