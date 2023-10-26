//
//  Index.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI



struct Index: View {
    @State var showSheet = false
    @ObservedObject var comic:ComicGradingViewModel

    var body: some View {

        VStack{
            
            Text("Menard Comic Grading").font(.title)
            
            Button(action: {
                showSheet = !showSheet
            }, label: {
                Text("Start Grading a Comic")
                    .padding()
                    .background(Color(#colorLiteral(red: 0.9, green: 0.5, blue: 0.5, alpha: 1)))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            })
        

        }.sheet(isPresented: $showSheet) {
            print("Sheet dismissed!")
        } content: {
            CreateComicSheet(comic: comic)
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color(#colorLiteral(red: 0.8, green: 0.6, blue: 0.6, alpha: 1)))


    }
}

