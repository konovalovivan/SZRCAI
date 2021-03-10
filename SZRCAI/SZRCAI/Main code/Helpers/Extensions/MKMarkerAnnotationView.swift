import MapKit.MKMarkerAnnotationView

extension MKMarkerAnnotationView {
    static var defaultId: String { MKMapViewDefaultAnnotationViewReuseIdentifier }
    static var reuseId: String { NSStringFromClass(Self.self) }
}
