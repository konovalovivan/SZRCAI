import Foundation
import UIKit
import CoreLocation

extension ViewController: ModelDelegate {
    func deselectPin(pin: PinAnnotation) {
        
    }
    
    func modelButtonExecute(sender: UIButton) {
        
    }
    
    internal func constructGraphs() {
        mapView.removeOverlays(mapView.overlays)
        
        let pins = mapView.annotations.filter({ $0.isKind(of: PinAnnotation.self) })
        let coords = pins.compactMap({ $0.coordinate })
        
        coords.forEach({ (start: CLLocationCoordinate2D) in
            let vertices = coords.filter({ $0 != start }) // getting all vertices excluding the starting point
            
            vertices.forEach({ (end: CLLocationCoordinate2D) in // enumeration of all vertices
                let locations = [start, end] // start and end vertices
                
                // MARK: вершины соединены ребрами при условии, что расстояние между вершинами не более 5км
                // condition: vertices are connected by edges, provided that the distance between the vertices is no more than 5 km
                print("distance", locations.distance)
                if locations.distance < 5000 {
                    let dashline = DashLine(locations: locations)
                    
                    // you can also delegate the storage of all vertices and graphs
                    // to into a separate class in which can their compare for find matches
                    let exists = mapView.overlays.contains(where: { $0.coordinate == dashline.coordinate })
                    
                    guard !exists else { return }
                    
                    // creating a graph between vertices
                    mapView?.addOverlay(dashline)
                    
                    if !mapView.model.graphsBuilt { mapView.model.graphsBuilt = true }
                    
                    #if DEBUG
                    print("graphs count:", mapView.overlays.count)
                    #endif
                } else {
                    let alert = UIAlertController(title: "Point is too far away!",
                                                  message: "The distance between the vertices should not be more than 5 km.",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ОК", style: .cancel))
                    present(alert, animated: true)
                }
            })
        })
    }
}
