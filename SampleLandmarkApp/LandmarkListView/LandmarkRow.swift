//
//  LandmarkRow.swift
//  SampleLandmarkApp
//
//  Created by 佐藤汰一 on 2023/06/11.
//

import SwiftUI

struct LandmarkRow: View {
    let imageName: String
    let name: String
    let isFavorite: Bool
    
    var body: some View {
        HStack{
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text(name)
            
            Spacer()
            
            if isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
        }
        .padding()
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        let models: [LandmarkModel] = JsonUtil.loadJson(fileName: "landmarkData")
        
        Group {
            LandmarkRow(imageName: models[0].imageName, name: models[0].name, isFavorite: models[0].isFavorite)
            LandmarkRow(imageName: models[1].imageName, name: models[1].name, isFavorite: models[1].isFavorite)
        }
        .previewLayout(.fixed(width: 400, height: 100))
        
    }
}
