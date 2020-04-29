import SwiftUI
import CoreLocation

struct Location: Hashable, Codable, Identifiable {
    var id: Int
    var gameType: String
    var locationName: String
    fileprivate var coordinates: Coordinates
    var address: String

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
