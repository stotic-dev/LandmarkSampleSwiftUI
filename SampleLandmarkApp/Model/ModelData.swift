//
//  ModelData.swift
//  SampleLandmarkApp
//
//  Created by 佐藤汰一 on 2023/06/12.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [LandmarkModel] = JsonUtil.loadJson(fileName: "landmarkData")
    
}
