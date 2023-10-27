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
            
            List{
                ForEach(Array(comic.comicGraded?.damagedPages!.keys ?? [:].keys), id: \.self){
                    key in
                    
                    Text("\(key) : \(comic.comicGraded?.damagedPages![key]!.name ?? "") ")
                }
            }.listStyle(.plain).frame(height: 100)
    
            
            Picker("Pick Overall Grade", selection: $selectedGrade){
                ForEach(Condition.allCases, id: \.self){
                    option in
                    Text("\(option.name)")
                }
            }.pickerStyle(.inline)
            
            
            
            Button(action: {
                comic.saveComicGrading(finishedComic: comic.comicGraded!)
            }, label: {
                Text("Finish Grading")
                    .padding()
                    .background(Color(#colorLiteral(red: 0.9, green: 0.5, blue: 0.5, alpha: 1)))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            })
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color(#colorLiteral(red: 0.8, green: 0.6, blue: 0.6, alpha: 1)))
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
