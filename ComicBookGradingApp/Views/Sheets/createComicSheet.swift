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
    @State public var price: String = ""
    
    @State public var date: Date = Date.now

    var body: some View {

        
        VStack {
            Text("Enter Comic Information").font(.title)
            
            Text("Title :")
            TextField("Title",text: $title).border(Color.black).textFieldStyle(.roundedBorder)
            
            Text("Company :")
            TextField("Company",text: $company).border(Color.black).textFieldStyle(.roundedBorder)
            
            Text("Issue Number :")
            TextField("Issue Number :", text: $num).border(Color.black).textFieldStyle(.roundedBorder).keyboardType(.decimalPad)
            
            
            Text("Price At Near Mint :")
            TextField("Issue Number :", text: $price).border(Color.black).textFieldStyle(.roundedBorder).keyboardType(.decimalPad)
            
            HStack{
                DatePicker(
                    "Release Date :",
                    selection: $date,
                    displayedComponents: [.date]
                ).datePickerStyle(.compact)
            }
            
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
                        price = comic.comicGraded?.marketPriceAtNM?.description ?? ""
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
                    var priceNum: Double? = nil
                        if(num != ""){
                            number = Int(num)
                        }
                    if(price != ""){
                        priceNum = Double(price)
                    }
                    let overallCondition = comic.comicGraded?.overallCondition ?? .noneSelected
                    let pages = comic.comicGraded?.damagedPages ?? [:]
                    let cover = comic.comicGraded?.coverCondition ?? [:]
                    let comicBook = ComicToBeGraded(title: self.title, number: number, company: self.company, releaseDate: date, marketPriceAtNM: priceNum, coverCondition: cover, damagedPages: pages, overall: overallCondition, price: comic.comicGraded?.marketPriceAtNM ?? 0)
                    if(comic.comicGraded == nil){
                        comic.startTracking(comicNew: comicBook)

                    }else{
                        comic.updateComicGraded(update: comicBook)
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
                price = comic.comicGraded?.marketPriceAtNM?.description ?? ""

            }

    }
    
}

