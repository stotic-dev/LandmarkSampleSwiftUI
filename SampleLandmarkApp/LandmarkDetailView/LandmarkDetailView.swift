//
//  LandmarkDetailView.swift
//  SampleLandmarkApp
//
//  Created by 佐藤汰一 on 2023/06/11.
//

import SwiftUI
import MapKit

struct LandmarkDetailView: View {
    @EnvironmentObject var modelData: ModelData
    
    let landmark: LandmarkModel
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id }) ?? 0
    }
    
    var body: some View {
        
        VStack{
            MapView(location: CLLocationCoordinate2D(latitude: landmark.coordinates.latitude, longitude: landmark.coordinates.longitude))
            
            LandmarkImageView(imageName: landmark.imageName)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            Spacer()
            
            ContentView(placeName: landmark.name, subTitle: landmark.park, country: landmark.state, description: landmark.description, favoriteFlg: $modelData.landmarks[landmarkIndex].isFavorite)
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let models: [LandmarkModel] = ModelData().landmarks
        
        LandmarkDetailView(landmark: models[0])
            .environmentObject(ModelData())
    }
}
