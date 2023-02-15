//
//  SpeechService.swift
//  CustomTextToSepeech
//
//  Created by Md Murad Hossain on 15/2/23.
//

import Foundation
import AVKit

class SpeechService: NSObject {
    
    static let shared = SpeechService()
    let speechSynthesizer = AVSpeechSynthesizer()
    
//    MARK: - Speech Methods
    
    func startSpeech(_ text: String) {
        
        self.stotSpeaking()
        if let language = NSLinguisticTagger.dominantLanguage(for: text) {
            let utterence = AVSpeechUtterance(string: text)
            utterence.voice = AVSpeechSynthesisVoice(language: language)
            utterence.voice = AVSpeechSynthesisVoice(language: "en-AU")
            utterence.rate = 0.5
            speechSynthesizer.speak(utterence)
        }
    }
    
    func stotSpeaking() {
        speechSynthesizer.stopSpeaking(at: .immediate)
    }
}
