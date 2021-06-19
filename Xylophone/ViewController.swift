import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
       
        print(sender.currentTitle)
        //playSound함수를 호출할때 누른 버튼의 제목에 따른 오디오를 키도록 하는 함수 currnetTitle로 사용할경우 오류가 발생하는데 이유는 선택적 문자열이라고 부르는 데이터 유형이기때문인데, 제목이 실제로 없는 버튼이 있을수 있기때문에 이러한 데이터유형을 추측하는것이다.실제로 없는 버튼이 있을 경우에는 앱이 다운되기 때문에 !를 사용해서 값이 무조건 있을것이라고 강조하는것.
        playSound(soundName: sender.currentTitle!)

        //버튼을 눌렀을때 투명도를 0.5 낮춘다.
        sender.alpha = 0.5

        //Code should execute after 0.2 second delay. 이 코드는 0.2초의 지연 시간 이후에 실행되도록 하는 코드이다.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque. 지연 시간이 끝난 이후에는 투명도를 1.0으로 다시 돌리는 코드를 사용한다.
            sender.alpha = 1.0
        }

    }

    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

    }
}
