//  Created for SpeakLine iOS in 2018
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
// Using Swift 4.0
// Running on macOS 10.13
/*
 Submit an email to Cosmic Arrows, LLC <laurence@cosmicarrows.com>

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.

*/

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var speakButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    let speechSynth = AVSpeechSynthesizer()
    
    override var nibName: String? {
        return "MainViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Action Methods
    
    @IBAction func speakIt(sender: UIButton) {
        
        //Get typed-in text as a string
        let string = textField.text
        if (string?.isEmpty)! {
            print("string from \(textField) is empty")
        } else {
            
            speechSynth.speak(AVSpeechUtterance.init(string: string!))
            //print("string is \"\(textField.text!)\"")
        }
    }
    
    @IBAction func stopIt(sender: UIButton) {
        //print("stop button clicked")
        speechSynth.stopSpeaking(at: AVSpeechBoundary.init(rawValue: 2)!)
    }

}
