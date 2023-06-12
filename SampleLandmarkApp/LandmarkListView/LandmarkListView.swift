//
//  LandmarkListView.swift
//  SampleLandmarkApp
//
//  Created by 佐藤汰一 on 2023/06/11.
//

import SwiftUI

struct LandmarkListView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var isFavorite = false{
        mutating didSet{
            toggleText = isFavorite ? "Favorite Only" : "All Landmark"
        }
    }
    @State var toggleText = "All Landmark"
    
    var filteredObjects: [LandmarkModel]{
        modelData.landmarks.filter({ !isFavorite || $0.isFavorite })
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                Toggle(isOn: $isFavorite) {
                    Text(toggleText)
                        .font(.title)
                }
                .padding()
                
                List {
                    ForEach(filteredObjects) { landmark in
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
    
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
            .environmentObject(ModelData())
    }
}
