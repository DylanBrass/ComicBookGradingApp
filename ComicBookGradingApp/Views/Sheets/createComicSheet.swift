//
//  createComicSheet.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-23.
//

import Foundation
import SwiftUI



struct CreateComicSheet: View {
    @Environment(\.dismiss) private var dismiss

    @ObservedObject var comic:ComicGradingViewModel
    
    @State public var title: String = ""
    
    @State public var company: String = ""
    
    @State public var date: Date = Date.now

    var body: some View {
        
        VStack {
            Text("Enter Comic Information").font(.title)
            
            TextField("Title :",text: $title).padding()
            TextField("Company :",text: $company).padding()
            DatePicker(
                   "Release Date",
                   selection: $date,
                   displayedComponents: [.date]
               )
            
            
            HStack{
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                })
                Button(action: {
                    
                    let comicBook = ComicToBeGraded(title: self.title, company: self.company, releaseDate: Date.now, coverCondition: [:], cornerCondition: [:])
                    
                    comic.startTracking(comicNew: comicBook)
                    
                    dismiss()
                }, label: {
                    Text("Confirm")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    
                    
                })
            }
        }
    }
    
}

