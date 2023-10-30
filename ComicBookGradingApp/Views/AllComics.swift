//
//  AllComics.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI

struct AllComics: View {
    
    @ObservedObject var comicVM: ComicGradingViewModel
    
    var body: some View {
        VStack{
            Text("All Previously Graded Comics").font(.title).padding(.top, 4)
            List{
                ForEach(comicVM.allComics, id: \.id){
                    comic in
                    Button(action: {
                        comicVM.editComic(id: comic.id)
                    }, label: {
                        Text("\(comic.title) : \(Condition.getNameFromValue(value:comicVM.getOverallGrade(comic: comic)))")
                    })
                }
            }
        }

    }
}
