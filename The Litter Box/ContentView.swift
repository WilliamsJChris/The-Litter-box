//
//  ContentView.swift
//  The Litter Box
//
//  Created by Christopher Williams on 2/11/20.
//  Copyright © 2020 ThunderCats. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            MapView()
            .navigationBarTitle(Text("Map View"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        // Start Frame Location
        let startLocation = CLLocationCoordinate2D(latitude: 33.44492917135115,
            longitude: -86.81618575369598)
        
        // Start Location Annotation
        let startAnnotation = MKPointAnnotation()
        startAnnotation.coordinate = startLocation
        startAnnotation.title = "Hickory Knoll"
        startAnnotation.subtitle = "Start Location"
        uiView.addAnnotation(startAnnotation)
        
        // Frame Location
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: startLocation, span: span)
        uiView.setRegion(region, animated: true)
        
        // Pin Location 1
        let location1 = CLLocationCoordinate2D(latitude: 33.4319484,
            longitude: -86.8155857)
        
        // Location 1 Annotation
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = location1
        annotation1.title = "Woodmere Creek"
        annotation1.subtitle = "779 Woodmere Creek Drive"
        uiView.addAnnotation(annotation1)
        
        // Pin Location 2
        let location2 = CLLocationCoordinate2D(latitude: 33.4648253,
            longitude: -86.7916904)
        
        // Location 2 Annotation
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = location2
        annotation2.title = "Samford University"
        annotation2.subtitle = "800 Lakeshore Drive"
        uiView.addAnnotation(annotation2)
    }
}
