//
//  PageDamageReport.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI

struct PageDamageReport: View {
    @Binding var page: Int
    
    @ObservedObject var comic:ComicGradingViewModel
    @State var num: String = ""
    @State var selectedCondition: Condition = .noneSelected
    
    var body: some View {
        VStack{
      
                    
            Text("Page Damage Report").font(.title).padding(.top, 4)
            
            
            List{
                ForEach(Array(comic.comicGraded?.damagedPages.keys.sorted(by: <) ?? [:].keys.sorted(by: <)), id: \.self){
                    key in
                    HStack{
                        Text("\(key) : \(comic.comicGraded?.damagedPages[key]!.name ?? "") ")
                        Spacer()
                        Button(action: {
                            comic.removePage(page: key)
                        }, label: {
                            Image(systemName: "delete.left.fill")
                                .padding().foregroundStyle(.white)
                                .background(.blue)
                                .clipShape(.circle)
                        })
                        
                    }
                }
            }.border(.black).frame(height: 200)
            
            HStack{
                Text("Enter Page # :").padding()
                TextField("Page Number :", text: $num).border(Color.black).textFieldStyle(.roundedBorder).padding().keyboardType(.decimalPad)
            }
            
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
                
                Button(action: {
                    var number: Int? = nil
                    
                    if(num != ""){
                        number = Int(num)
                        comic.addDamagedPage(page: number!, cond: selectedCondition)
                    }
                    
                    num = ""
                }, label: {
                    Text("Report")
                        .padding(10)
                        .background(Color.green)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    
                    
                })
            Spacer()

            }
        }
    }

