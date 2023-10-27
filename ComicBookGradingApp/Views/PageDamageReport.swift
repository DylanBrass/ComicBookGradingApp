//
//  PageDamageReport.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI

struct PageDamageReport: View {
    
    @ObservedObject var comic:ComicGradingViewModel
    @State var num: String = ""
    @State var selectedCondition: Condition = .cvls
    
    var body: some View {
        VStack{
            
            Text("Page Damage Report")
            List{
                ForEach(Array(comic.comicGraded?.damagedPages!.keys ?? [:].keys), id: \.self){
                    key in
                    
                    Text("\(key) : \(comic.comicGraded?.damagedPages![key]!.name ?? "") ")
                }
            }.listStyle(.plain)
            
            TextField("Page Number :", text: $num).textFieldStyle(.roundedBorder).padding().keyboardType(.decimalPad)
            Picker("Pick Condition:", selection: $selectedCondition){
                
                ForEach(Condition.allCases, id: \.self){
                    option in
                    Text("\(option.name)")
                }
            }.pickerStyle(.inline)
            
            Button(action: {
                var number: Int? = nil
                    
                if(num != ""){
                    number = Int(num)
                    comic.addDamagedPage(page: number!, cond: selectedCondition)
                }
                
                num = ""
            }, label: {
                Text("Report")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                
                
            })
     
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color(#colorLiteral(red: 0.8, green: 0.6, blue: 0.6, alpha: 1)))

    }
}
