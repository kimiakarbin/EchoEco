import SwiftUI

class LanguagePageViewModel: ObservableObject {
    // Text split into chunks (updated the text as per your request)
    let fullText: [String] = [
        "I arrive in the village and try to talk to the people, but they don’t understand me.",
        "They speak a language called Zargari. I realize I need to learn it to communicate.",
        "An elder sits with me and teaches me words.",
        "Now help me in this process."
    ]
    
    // State variables to control text and button
    @Published var currentTextIndex = 0
    @Published var continueButtonText = "Next" // Button text changes based on index
    @Published var isNextButtonDisabled = false // State to control the button's disabled state
    
    // Function to move to the next part of the text
    func nextText() {
        if currentTextIndex < fullText.count - 1 {
            currentTextIndex += 1
        }
    }
    
    // Function to check if all text has been shown
    func isLastText() -> Bool {
        return currentTextIndex == fullText.count - 1 // This ensures the condition is met only when the last part is shown
    }
    
    // Function to update button text when all parts are shown
    func updateButtonText() -> String {
        return isLastText() ? "Continue" : "Next"
    }
    
    // Get the current chunk of text
    func currentText() -> String {
        return fullText[currentTextIndex]
    }
}
