import UIKit
import MapKit

class MapView: MKMapView {
    
    var model: Model = .shared
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
