
import SwiftUI

struct LanguagePageView: View {
    let continentID: Int
    let continentName: String
    let continentFacts: String
    let onContinue: () -> Void // Callback to trigger navigation
    
    @ObservedObject var viewModel: LanguagePageViewModel
    @State private var navigateToNextPage = false // State for navigation
    
    init(continentID: Int, continentName: String, continentFacts: String, onContinue: @escaping () -> Void) {
        self.continentID = continentID
        self.continentName = continentName
        self.continentFacts = continentFacts
        self.onContinue = onContinue
        self.viewModel = LanguagePageViewModel() // Initializing the ViewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color.pastelSkyBlue, Color.pastelGreen]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack {
                    // Title inside a rectangle
                    Text("Welcome to \(continentName). The man arrived at the first village in \(continentName). He saw: \(continentFacts.prefix(50))")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.pastelMint)
                        .cornerRadius(15)
                        .foregroundColor(.mint)
                    
                    // Rectangle to display current chunk of text
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.pastelPink)
                            .frame(height: 200)
                            .shadow(radius: 5)
                        
                        VStack {
                            // Show only the current chunk of text
                            Text(viewModel.currentText())
                                .font(.body)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.pink)
                                .padding()
                                .frame(maxWidth: .infinity)
                            
                            // Next Button
                            Button(action: {
                                viewModel.nextText() // Reveal the next chunk of text
                                if viewModel.isLastText() {
                                    navigateToNextPage = true // Navigate to the next page when the last text is shown
                                }
                            }) {
                                Text(viewModel.updateButtonText())
                                    .cornerRadius(15)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 150)
                                    .background(viewModel.isLastText() ? Color.gray : Color.pastelYellow)
                            }
                            .disabled(viewModel.isNextButtonDisabled) // Disable the button when it's the last part
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    // Back Button
                    Button(action: {
                        onContinue() // Navigate back to the map
                    }) {
                        Text("Back to Map")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                .padding()
                
                // Navigation to the next page (LanguageLearningPage) after clicking "Continue"
                .navigationDestination(isPresented: $navigateToNextPage) {
                    LanguageLearningPage() // Replace with your actual learning page
                }
            }
        }
    }
}
