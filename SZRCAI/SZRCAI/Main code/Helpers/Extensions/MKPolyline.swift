import Foundation
import MapKit.MKPolyline

extension MKPolyline {
    convenience init(locations: [CLLocationCoordinate2D]) {
        self.init(coordinates: locations, count: locations.count)
    }
}
