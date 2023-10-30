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
    @Binding var page: Int

    var body: some View {

        VStack{
            VStack(spacing:0){
                Text("Menard Comic Grading").font(.title).padding()
                
                Button(action: {
                    showSheet = !showSheet
                }, label: {
                    if(comic.comicGraded == nil){
                        Text("Start Grading a Comic")
                            .padding(10)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }else{
                        Text("Update  Comic")
                            .padding(10)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                        
                    }
                })
            }.frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
        }.frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
            .sheet(isPresented: $showSheet) {
            print("Sheet dismissed!")
        } content: {
            CreateComicSheet(page: $page,comic: comic)
        }

        
    }
}

