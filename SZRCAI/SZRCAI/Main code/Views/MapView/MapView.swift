import UIKit
import MapKit

class MapView: MKMapView {
    
    var model: Model = .shared
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        mapType = .standard
        
        showsUserLocation = true
        userTrackingMode = .none
        
        showsPointsOfInterest = true
        
        showsCompass = true
        showsScale = true
        isZoomEnabled = true
        isScrollEnabled = true
        
        register(PinMarkerView.self, forAnnotationViewWithReuseIdentifier: PinMarkerView.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
