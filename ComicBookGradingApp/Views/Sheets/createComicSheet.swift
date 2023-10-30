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

  
    
    @Binding var page: Int

    @ObservedObject var comic:ComicGradingViewModel
    
    @State public var title: String = ""
    
    @State public var company: String = ""   
    
    
    @State public var num: String = ""
    
    @State public var date: Date = Date.now

    var body: some View {

        
        VStack {
            Text("Enter Comic Information").font(.title)
            
            TextField("Title :",text: $title).textFieldStyle(.roundedBorder).padding()
            TextField("Company :",text: $company).textFieldStyle(.roundedBorder).padding()
            TextField("Issue Number :", text: $num).textFieldStyle(.roundedBorder).padding().keyboardType(.decimalPad)
            DatePicker(
                   "Release Date",
                   selection: $date,
                   displayedComponents: [.date]
            ).datePickerStyle(.wheel)
              
            
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
                if(comic.comicGraded != nil){
                    Button(action: {
                        comic.endTracking()
                        title = comic.comicGraded?.title ?? ""
                        company = comic.comicGraded?.company ?? ""
                        num = comic.comicGraded?.number?.description ?? ""
                    }, label: {
                        Text("Clear Selection")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    })
                }
                
                Button(action: {
                        var number: Int? = nil
                        
                        if(num != ""){
                            number = Int(num)
                        }
                    let comicBook = ComicToBeGraded(title: self.title, number: number, company: self.company, releaseDate: date, coverCondition: [:])

                    if(comic.comicGraded == nil){
                        comic.startTracking(comicNew: comicBook)

                    }else{
                        comic.updateCimicGraded(update: comicBook)
                    }
                    page = 2
                    dismiss()
                }, label: {
                    Text("Confirm")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                })
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .onAppear(){
                title = comic.comicGraded?.title ?? ""
                company = comic.comicGraded?.company ?? ""
                num = comic.comicGraded?.number?.description ?? ""
            }

    }
    
}

