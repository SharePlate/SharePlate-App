import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    @Binding var tappedCoordinate: CLLocationCoordinate2D?
    var userLocation: CLLocationCoordinate2D?
    @Binding var currentAddress: String
    @Binding var selectedAddress: String
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsUserLocation = true // Show the user's location
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.tapAction(gestureRecognizer:)))
        mapView.addGestureRecognizer(tapGestureRecognizer)
        
        if let userLocation = userLocation {
            let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(region, animated: true)
            print("Setting initial map region to user's location.")
        }
        
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeAnnotations(mapView.annotations)
        
        // Add marker for tapped coordinate
        if let tappedCoordinate = tappedCoordinate {
            let annotation = MKPointAnnotation()
            annotation.coordinate = tappedCoordinate
            annotation.title = selectedAddress
            mapView.addAnnotation(annotation)
            
            // Center map around the tapped coordinate
            let region = MKCoordinateRegion(center: tappedCoordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(region, animated: true)
        }
        
        // Update the current address based on userLocation
        if let userLocation = userLocation {
            let location = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
            context.coordinator.reverseGeocode(location: location) { address in
                self.currentAddress = address ?? "Address not found"
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, currentAddress: $currentAddress, selectedAddress: $selectedAddress)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        let geocoder = CLGeocoder()
        @Binding var currentAddress: String
        @Binding var selectedAddress: String
        
        init(_ parent: MapView, currentAddress: Binding<String>, selectedAddress: Binding<String>) {
            self.parent = parent
            _currentAddress = currentAddress
            _selectedAddress = selectedAddress
        }
        
        @objc func tapAction(gestureRecognizer: UITapGestureRecognizer) {
            let mapView = gestureRecognizer.view as? MKMapView
            let touchPoint = gestureRecognizer.location(in: mapView)
            let coordinate = mapView?.convert(touchPoint, toCoordinateFrom: mapView)
            if let coordinate = coordinate {
                parent.tappedCoordinate = coordinate
                print("Tapped Coordinate: \(coordinate.latitude), \(coordinate.longitude)")
                
                // Reverse geocode to get the address for the tapped location
                let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                reverseGeocode(location: location) { address in
                    self.selectedAddress = address ?? "Address not found"
                }
            }
        }
        
        func reverseGeocode(location: CLLocation, completion: @escaping (String?) -> Void) {
            geocoder.reverseGeocodeLocation(location) { placemarks, error in
                if let error = error {
                    print("Reverse geocoding failed: \(error.localizedDescription)")
                    completion(nil)
                } else if let placemark = placemarks?.first {
                    let address = [placemark.name,
                                   placemark.locality,
                                   placemark.administrativeArea,
                                   placemark.country]
                        .compactMap { $0 }
                        .joined(separator: ", ")
                    print("Address: \(address)")
                    completion(address)
                } else {
                    completion(nil)
                }
            }
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "MyAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
            
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.glyphImage = UIImage(systemName: "house")
                annotationView?.markerTintColor = .red
            } else {
                annotationView?.annotation = annotation
                annotationView?.glyphImage = UIImage(systemName: "house")
            }
            
            return annotationView
        }
    }
}
