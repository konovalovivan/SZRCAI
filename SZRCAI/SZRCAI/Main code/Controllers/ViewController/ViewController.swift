import UIKit
import MapKit

// Тестовое задание «СЗ РЦАИ» iOS Developer

class ViewController: UIViewController {
    
    var mapView: MapView!
    
    /// Button for building graphs and routes
    weak var mainButton: UIButton!
    weak var clearButton: UIButton!
    
    var buttonKVO: NSKeyValueObservation!
    var pinsKVO: NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = .init(frame: view.frame)
        mapView.delegate = self
        view.addSubview(mapView)
        
        mapView.model.delegate = self
        
        buttonsSetup()
        pinsKVOFunc()
    }
}
