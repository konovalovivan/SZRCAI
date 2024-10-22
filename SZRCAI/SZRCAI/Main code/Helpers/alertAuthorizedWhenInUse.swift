import UIKit

func alertAuthorizedWhenInUse() -> UIAlertController {
    let alert = UIAlertController(title: "You have banned location tracking", message: "To resume tracking location, grant the app access to geolocation in your iPhone settings\n(Privacy > Location Services)", preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Close", style: .cancel))
    alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
        let settings = UIApplication.openSettingsURLString
        if let id = Bundle.main.bundleIdentifier,
           let url = URL(string: "\(settings)&path=LOCATION/\(id)") {
            UIApplication.shared.open(url)
        }
    }))
    return alert
}
