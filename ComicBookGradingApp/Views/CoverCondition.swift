//
//  CoverCondition.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI

struct CoverCondition: View {
    @Binding var page: Int

    @State var selectedCover = Cover.FRONT
    @State var selectedCondition = Condition.noneSelected
    @ObservedObject var comic: ComicGradingViewModel
    var body: some View {
        VStack{
       

            Text("Cover Condition").font(.title).padding(.top, 4)
            
            List{
                ForEach(Array(comic.comicGraded?.coverCondition.keys ?? [:].keys), id: \.self){
                    key in
                    
                    Text("\(key.name) : \(comic.comicGraded?.coverCondition[key]?.name ?? "") ")
                    
                }
            }.frame(height: 150)
            
            Picker("Pick Cover", selection: $selectedCover){
                
                ForEach(Cover.allCases, id: \.self){
                    option in
                    Text("\(option.name)")
                }
             
                
            }.pickerStyle(.inline)
            HStack{
                Text("Select Condition : ")
                Menu{
                    Picker("Pick Condition", selection: $selectedCondition){
                        
                        ForEach(Condition.allCases, id: \.self){
                            option in
                            Text("\(option.name)")
                        }
                    }.pickerStyle(.inline)
                } label: {
                    Text("\(selectedCondition.name)") .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
            
            }
            Button(action: {
                comic.coverGrading(cover: selectedCover, condition: selectedCondition)
            }, label: {
                Text("Confirm")
                    .padding(10)
                    .background(Color.green)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            })
            Spacer()
        }.frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
    }
}
