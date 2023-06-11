//
//  JsonUtil.swift
//  SampleLandmarkApp
//
//  Created by 佐藤汰一 on 2023/06/11.
//

import Foundation

struct JsonUtil {
    
    static func loadJson<T: Decodable>(fileName: String) -> T {
        
        guard let jsonFile = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("failed load json file")
        }
        
        do {
            let json = try Data(contentsOf: jsonFile)
            let decoder = JSONDecoder()
            let model = try decoder.decode(T.self, from: json)
            
            return model
            
        }catch{
            fatalError("failed load data from json: \(error.localizedDescription)")
        }
        
    }
}
