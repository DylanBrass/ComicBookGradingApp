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
    init(comic: ComicGradingViewModel) {
        self.comic = comic
    }
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
            ).datePickerStyle(.graphical)
              
            
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
                    
                    var number: Int? = nil
                    
                    if(num != ""){
                        number = Int(num)
                    }
                  
                    
                    
                    
                    let comicBook = ComicToBeGraded(title: self.title, number: number, company: self.company, releaseDate: date, coverCondition: [:], cornerCondition: [:])
                    
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
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color(#colorLiteral(red: 0.8, green: 0.6, blue: 0.6, alpha: 1)))
            .onAppear(){
                title = comic.comic?.title ?? ""
                company = comic.comic?.company ?? ""
                num = comic.comic?.number?.description ?? ""
            }

    }
    
}

