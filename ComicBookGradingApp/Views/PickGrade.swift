//
//  PickGrade.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI

struct PickGrade: View {
    
    @ObservedObject var comic: ComicGradingViewModel
    
    @State var formattedDate: String = ""
    
    @State var selectedGrade: Condition = Condition.cvls
    
    var body: some View {
        VStack{
            Text("Current Informatio :").font(.title)
            Text("Title : \(comic.comic?.title ?? "Not Set")")
            Text("Company : \(comic.comic?.company ?? "Not Set")")
            if(comic.comic?.number == nil){
                Text("Issue Number : Not Set")
            }else{
                Text("Issue Number : \(comic.comic?.number ?? 0)")
            }
            
            if(comic.comic?.releaseDate == nil){
                Text("Release Date : Not Set")
            }else{
                Text("Release Date : \(formattedDate)")
            }
            
            Picker("Pick Overall Grade", selection: $selectedGrade){
                ForEach(Condition.allCases, id: \.self){
                    option in
                    Text("\(option.name)")
                    
                }
            }.pickerStyle(.inline)
            
            
            
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color(#colorLiteral(red: 0.8, green: 0.6, blue: 0.6, alpha: 1)))
            .onAppear(){
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                if(comic.comic?.releaseDate == nil){
                        formattedDate = ""
                }else{
                    formattedDate = formatter.string(from: comic.comic?.releaseDate ?? Date.now)
                }
            }

    }
}
