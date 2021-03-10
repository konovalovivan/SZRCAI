import Foundation
import MapKit

@objc class PinAnnotation: NSObject, MKAnnotation {
    let id: String!
    let title: String?
    let subtitle: String?
    var markerColor: UIColor?
    @objc dynamic var coordinate: CLLocationCoordinate2D
    
    init(t title: String,
         sub subtitle: String?,
         c coordinates: CLLocationCoordinate2D) {
        self.id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinates
        super.init()
    }
}
