import SwiftUI

struct MapView: View {
    @State private var unlockedContinents: Set<Int> = [1] // Start with the first continent unlocked
    @State private var currentContinent: Int? = nil // Track the current continent for navigation
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    // World Image as Background
                    Image("world") // Replace with your world map image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea(edges: .all) // Ignore safe area on all edges
                    
                    
                    // Add Buttons for Continents with Lock Icons
                    continentButton(
                        position: normalizedPoint(geometry, x: 0.85, y: 0.26), // Asia (Blue)
                        continentID: 4,
                        continentName: "Asia",
                        continentFacts: "Asia is the largest continent and home to the Yangtze River."
                    )
                    continentButton(
                        position: normalizedPoint(geometry, x: 0.4, y: 0.4), // Europe (Orange)
                        continentID: 3,
                        continentName: "Europe",
                        continentFacts: "Europe has many historical rivers like the Danube."
                    )
                    continentButton(
                        position: normalizedPoint(geometry, x: 0.69, y: 0.6), // Africa (Red)
                        continentID: 2,
                        continentName: "Africa",
                        continentFacts: "Africa is home to the Nile, the world's longest river."
                    )
                    continentButton(
                        position: normalizedPoint(geometry, x: 0.28, y: 0.004), // Americas (Purple)
                        continentID: 5,
                        continentName: "Americas",
                        continentFacts: "The Amazon River is one of the largest rivers in the Americas."
                    )
                    continentButton(
                        position: normalizedPoint(geometry, x: 0.87, y: 0.89), // Australia (Pink)
                        continentID: 1,
                        continentName: "Australia",
                        continentFacts: "Australia is known for its unique ecosystems and rivers."
                    )
                }
                .navigationBarTitle("World Map", displayMode: .inline)
            }
        }
    }
    
    // MARK: - Normalize Points to Fit the Screen
    private func normalizedPoint(_ geometry: GeometryProxy, x: CGFloat, y: CGFloat) -> CGPoint {
        CGPoint(
            x: geometry.size.width * x,
            y: geometry.size.height * y
        )
    }
    
    // MARK: - Paths (Optional; Remove if Unnecessary)
    private func drawPath(start: CGPoint, end: CGPoint) -> some View {
        Path { path in
            path.move(to: start)
            path.addLine(to: end)
        }
        .stroke(Color.gray, lineWidth: 2)
    }
    
    // MARK: - Continent Button with Lock Icon
    private func continentButton(position: CGPoint, continentID: Int, continentName: String, continentFacts: String) -> some View {
        ZStack {
            // Navigation Link
            NavigationLink(
                destination: LanguagePageView(
                    continentID: continentID,
                    continentName: continentName,
                    continentFacts: continentFacts,
                    onContinue: {
                        // Unlock the next continent
                        unlockedContinents.insert(continentID + 1)
                        currentContinent = nil
                    }
                ),
                tag: continentID,
                selection: $currentContinent
            ) {
                EmptyView()
            }
            .hidden()
            
            // Continent Button with Lock Icon
            Button(action: {
                if unlockedContinents.contains(continentID) {
                    currentContinent = continentID
                }
            }) {
                // Show only the lock icon when locked
                if !unlockedContinents.contains(continentID) {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                } else {
                    // Transparent button for unlocked continents
                    Color.clear
                        .frame(width: 30, height: 30)
                }
            }
            .position(position)
            .disabled(!unlockedContinents.contains(continentID)) // Disable if locked
        }
    }
}
