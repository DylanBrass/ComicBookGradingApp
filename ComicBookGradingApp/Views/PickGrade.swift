//
//  PickGrade.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI

struct PickGrade: View {
    @Binding var page: Int
    
    @ObservedObject var comic: ComicGradingViewModel
    
    @State var formattedDate: String = ""
    
    @State var selectedGrade: Condition = Condition.noneSelected
    
    var body: some View {
        VStack(alignment: .center){
            Text("Current Information :").font(.title).padding(.top, 4)
           
            Text("Title : \(comic.comicGraded?.title ?? "Not Set")")
            Text("Company : \(comic.comicGraded?.company ?? "Not Set")")
            if(comic.comicGraded?.number == nil){
                Text("Issue Number : Not Set")
            }else{
                Text("Issue Number : \(comic.comicGraded?.number ?? 0)")
            }
            
            if(comic.comicGraded?.releaseDate == nil){
                Text("Release Date : Not Set")
            }else{
                Text("Release Date : \(formattedDate)")
            }
            Text("Covers : ").padding(.top,2).font(.title3)
            List{
                ForEach(Array(comic.comicGraded?.coverCondition.keys ?? [:].keys), id: \.self){
                    key in
                    
                    Text("\(key.name) : \(comic.comicGraded?.coverCondition[key]?.name ?? "") ")
                    
                }
            }.frame(height: 125).border(.black)
            Text("Pages : ").padding(.top,2).font(.title3)
            List{
                ForEach(Array(comic.comicGraded?.damagedPages.keys.sorted(by: <) ?? [:].keys.sorted(by: <)), id: \.self){
                    key in
                    
                    Text("\(key) : \(comic.comicGraded?.damagedPages[key]!.name ?? "") ")
                }
            }.frame(height: 100).border(.black)
    
            
            HStack{
                Text("Pick Overall Grade :")
                Menu{
                    Picker("Pick Overall Grade", selection: $selectedGrade){
                        ForEach(Condition.allCases, id: \.self){
                            option in
                            Text("\(option.name)")
                        }
                    }.pickerStyle(.inline)
                } label: {
                    Text("\(selectedGrade.name)") .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            Button(action: {
                comic.saveComicGrading(finishedComic: comic.comicGraded!)
            }, label: {
                Text("Finish Grading")
                    .padding(10)
                    .background(Color.green)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            })
            
            Spacer()
            
            
        }
            .onAppear(){
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                if(comic.comicGraded?.releaseDate == nil){
                        formattedDate = ""
                }else{
                    formattedDate = formatter.string(from: comic.comicGraded?.releaseDate ?? Date.now)
                }
            }

    }
}
