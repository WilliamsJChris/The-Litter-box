import SwiftUI
import CoreLocation

struct Location: Hashable, Codable, Identifiable {
    var id: Int
    var gameType: String
    var locationName: String
//    fileprivate var coordinates: Coordinates
    var latitude: Double
    var longitude: Double
    var address1: String
    var address2: String
    var city: String
    var state: String
    var zip: String
    var date: String
    var time: String

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
    
    init() {
        self.id = 0
        self.gameType = ""
        self.locationName = ""
        self.address1 = ""
        self.address2 = ""
        self.city = ""
        self.state = ""
        self.zip = ""
        self.date = ""
        self.time = ""
        self.longitude = 0.0
        self.latitude = 0.0
        }
        
    }


struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
