//
//  ContentView.swift
//  SampleLandmarkApp
//
//  Created by 佐藤汰一 on 2023/06/11.
//

import SwiftUI

struct ContentView: View {
    
    let placeName: String
    let subTitle: String
    let country: String
    let description: String
    
    @Binding var favoriteFlg: Bool
    
    var body: some View {
        VStack {
            HStack{
                Text(placeName)
                    .frame(alignment: .leading)
                    .font(.title)
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(favoriteFlg ? .yellow : .gray)
                    .onTapGesture {
                        favoriteFlg.toggle()
                    }
            }
            
            HStack {
                Text(subTitle)
                    .foregroundColor(.gray)
                Spacer()
                Text(country).foregroundColor(.gray)
            }
            
            Divider()
            
            HStack{
                Text("About Place \(placeName)")
                    .frame(alignment: .leading)
                    .font(.title2)
                Spacer()
            }
            
            ScrollView{
                Text(description)
                    .frame(alignment: .leading)
            }
            
        }
        .padding()
    }
    
    private func updateLandmarkModel(){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var favoriteFlg = false
    
    static var previews: some View {
        ContentView(placeName: "Place Name", subTitle: "sub title name", country: "Country", description: "asdsfesefsfesfsefsefsefsefseffdfefsfefsefsefsefsefsefsefsefsefsefsefsefsefsefsefsefse", favoriteFlg: $favoriteFlg)
    }
}
