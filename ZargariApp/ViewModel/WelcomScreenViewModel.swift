// ViewModel/WelcomeViewModel.swift
import Foundation

class WelcomeScreenViewModel: ObservableObject {
    // Publishable properties for the View to observe
    @Published var welcomeData: WelcomeScreenModel
    
    init() {
        // Initialize with static data or dynamic logic
        self.welcomeData = WelcomeScreenModel(
            appName: "Secret River Tales",
            tagline: "Discover, Learn, and Save the World!",
            startButtonText: "Start Adventure",
            settingsLabel: "Settings"
        )
    }
    
    // Add navigation logic here if needed
    func navigateToNextScreen() {
        // Implement navigation logic (e.g., update app state or use a navigation stack)
    }
}
