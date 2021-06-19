import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
       
        print(sender.currentTitle)
        playSound(soundName: sender.currentTitle!) //!을 붙이는 이유, currentTitle이 존재하지않는 값일수도 있기 때문에, 컴퓨터는 확신을 가지지 못한다. 그래서 값이 확실히 있는 경우에는 !을 붙여서 우리가 컴퓨터에게 확신을 주는것이다.
    }
    
    func playSound(soundName: String) {
        //url을 C.wav 파일의 위치로 설정
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!) //파일을 player에 넣음
        player.play() //소리를 재생해라.
        //전화기가 무음 모드가 켜져있을때 소리가 나오도록 하는 부분을 제거했기 때문에 무음모드일때는 소리가 나지않는다. 
                
    }
}
