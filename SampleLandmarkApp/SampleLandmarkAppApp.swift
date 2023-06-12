//
//  SampleLandmarkAppApp.swift
//  SampleLandmarkApp
//
//  Created by 佐藤汰一 on 2023/06/11.
//

import SwiftUI

@main
struct SampleLandmarkAppApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            LandmarkListView()
                .environmentObject(ModelData())
        }
    }
}
