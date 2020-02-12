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
    // 1.
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    // 2.
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        // 3.
        let location = CLLocationCoordinate2D(latitude: 51.50007773,
            longitude: -0.1246402)
        // 4.
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        uiView.setRegion(region, animated: true)
        
        // 5.
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Big Ben"
        annotation.subtitle = "London"
        uiView.addAnnotation(annotation)
    }
}
