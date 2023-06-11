//
//  LandmarModel.swift
//  SampleLandmarkApp
//
//  Created by 佐藤汰一 on 2023/06/11.
//

import Foundation
import MapKit

struct LandmarkModel:Codable, Identifiable {
    
    let id: Int
    let name: String
    let category: String
    let city: String
    let state: String
    let isFeatured: Bool
    let isFavorite: Bool
    let park: String
    let description: String
    let imageName: String
    let coordinates: Coordenate
    
    struct Coordenate: Codable {
        let longitude: Double
        let latitude: Double
    }
}
