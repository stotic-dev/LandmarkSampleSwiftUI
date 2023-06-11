//
//  LandmarkListView.swift
//  SampleLandmarkApp
//
//  Created by 佐藤汰一 on 2023/06/11.
//

import SwiftUI

struct LandmarkListView: View {
    
    let landmarks: [LandmarkModel] = {
        return JsonUtil.loadJson(fileName: "landmarkData")
    }()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(landmarks) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkRow(imageName: landmark.imageName, name: landmark.name, isFavorite: landmark.isFavorite)
                    }
                    
                }
            }
        }
        
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
    }
}
