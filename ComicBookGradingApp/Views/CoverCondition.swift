//
//  CoverCondition.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI

struct CoverCondition: View {
    
    @State var selectedCover = Cover.FRONT
    @State var selectedCondition = Condition.cvls
    @ObservedObject var comic: ComicGradingViewModel
    var body: some View {
        VStack{
            
            Text("Cover Condition")
            
            
                ForEach(Array(comic.comicGraded?.coverCondition.keys ?? [:].keys), id: \.self){
                    key in
                    
                    Text("\(key.name) : \(comic.comicGraded?.coverCondition[key]?.name ?? "") ")
                    
                }
       
            
            Picker("Pick Cover", selection: $selectedCover){
                
                ForEach(Cover.allCases, id: \.self){
                    option in
                    Text("\(option.name)")
                }
             
                
            }.pickerStyle(.inline)
            
            Picker("Pick Condition:", selection: $selectedCondition){
                
                ForEach(Condition.allCases, id: \.self){
                    option in
                    Text("\(option.name)")
                }
            }.pickerStyle(.inline)
            
            
            Button(action: {
                
                comic.coverGrading(cover: selectedCover, condition: selectedCondition)
                
            }, label: {
                Text("Confirm")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                
                
            })
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color(#colorLiteral(red: 0.8, green: 0.6, blue: 0.6, alpha: 1)))

    }
}
