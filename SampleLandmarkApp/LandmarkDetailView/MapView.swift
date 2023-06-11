//
//  MapView.swift
//  SampleLandmarkApp
//
//  Created by 佐藤汰一 on 2023/06/11.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let location: CLLocationCoordinate2D
    
    @State var region = MKCoordinateRegion()
    
    var body: some View {
        let mapMarker = MarkerPlace(location: region.center)
        
        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: [mapMarker], annotationContent: { place in
            MapMarker(coordinate: place.location)
        })
            .onAppear{
                setRegion(with: self.location)
            }
            .frame(height: 300)
            .ignoresSafeArea(edges: .top)
    }
    
    private func setRegion(with location: CLLocationCoordinate2D){
        self.region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let models: [LandmarkModel] = JsonUtil.loadJson(fileName: "landmarkData")
        let location = CLLocationCoordinate2D(latitude: models[0].coordinates.latitude, longitude: models[0].coordinates.longitude)
        
        MapView(location: location)
    }
}
