import SwiftUI

struct StoryScreenView: View {
    @StateObject private var viewModel = StoryViewModel()
    @State private var navigateToMap = false

    var body: some View {
        ZStack(alignment: .top) {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.pastelMint, Color.pastelMint]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                // Story Cloud Box
                ZStack(alignment: .top) {
                    Image("cloud")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .shadow(radius: 5)
                        .scaleEffect(x: -1, y: 1)

                    VStack(spacing: 20) {
                        Text(viewModel.currentStoryText)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .font(.body)
                            .frame(width: 280, height: 100)
                            .padding(.top, 20)

                        // Image Button with "Next" Text
                        if !viewModel.isLastStory {
                            Button(action: {
                                viewModel.goToNextStory()
                            }) {
                                ZStack {
                                    Image("button") // Replace with your button image asset
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 120, height: 50)

                                    Text("Next")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .padding(.top, 30)
                }
                .frame(width: 350, height: 300)

                Spacer()

                // HStack for Thinking Man and Arrow
                HStack {
                    // Thinking Man Always on Left
                    Image("thinkingman")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 260, height: 400)
                        .scaleEffect(x: -1, y: 1)

                    // Yellow Arrow - Appears in Last Step
                    if viewModel.isLastStory {
                        Button(action: {
                            navigateToMap = true
                        }) {
                            Image("arrow")
                                .resizable()
                                .scaledToFit()
                                .padding(.top, 30)
                                .frame(width: 85, height: 170)
                                .scaleEffect(x: -1, y: 1)
                        }
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity) // Ensures proper alignment
            }
            .padding()
        }
        // Navigation to Map View
        .navigationDestination(isPresented: $navigateToMap) {
            MapView()
        }
    }
}
