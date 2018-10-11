import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!

    override func viewDidLoad() {
        print("MapViewController loaded its view")
    }

    override func loadView() {
        mapView = MKMapView()
        view = mapView

        let standard = NSLocalizedString("Standard", comment: "Standard map view")
        let hybrid = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let satellite = NSLocalizedString("Satellite", comment: "Satellite map view")

        let segmentedControl =
            UISegmentedControl(items: [standard, hybrid, satellite])
        segmentedControl.backgroundColor
            = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0

        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)),
                                   for: .valueChanged)

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)

        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)

        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)

        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }

    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
}
