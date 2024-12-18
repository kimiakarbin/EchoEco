
import SwiftUI

class MapViewModel: ObservableObject {
    @Published var continents: [Continent]

    init() {
        self.continents = [
            Continent(id: 1, name: "1", position: CGPoint(x: 100, y: 600), connectedTo: [2]),
            Continent(id: 2, name: "2", position: CGPoint(x: 200, y: 450), connectedTo: [3]),
            Continent(id: 3, name: "3", position: CGPoint(x: 300, y: 300), connectedTo: [4]),
            Continent(id: 4, name: "4", position: CGPoint(x: 400, y: 150), connectedTo: [])
        ]
    }

    // Fetch connected paths
    func getPaths() -> [(CGPoint, CGPoint)] {
        var paths: [(CGPoint, CGPoint)] = []
        for continent in continents {
            for connection in continent.connectedTo {
                if let connectedContinent = continents.first(where: { $0.id == connection }) {
                    paths.append((continent.position, connectedContinent.position))
                }
            }
        }
        return paths
    }
}
