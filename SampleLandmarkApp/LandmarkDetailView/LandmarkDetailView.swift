//
//  LandmarkDetailView.swift
//  SampleLandmarkApp
//
//  Created by 佐藤汰一 on 2023/06/11.
//

import SwiftUI
import MapKit

struct LandmarkDetailView: View {
    
    let landmark: LandmarkModel
    
    var body: some View {
        
        VStack{
            MapView(location: CLLocationCoordinate2D(latitude: landmark.coordinates.latitude, longitude: landmark.coordinates.longitude))
            
            LandmarkImageView(imageName: landmark.imageName)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            Spacer()
            
            ContentView(placeName: landmark.name, subTitle: landmark.park, country: landmark.state, description: landmark.description)
        }
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let models: [LandmarkModel] = JsonUtil.loadJson(fileName: "landmarkData")
        
        LandmarkDetailView(landmark: models[0])
    }
}
