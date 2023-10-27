//
//  ViewModelComicGrading.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import Foundation


class ComicGradingViewModel: ObservableObject{
    
    @Published var comicGraded: ComicToBeGraded?
    
    @Published var allComics: [ComicToBeGraded] = [ComicToBeGraded(title: "Batman", number: 2, company: "DC", releaseDate: Date.now, marketPriceAtNM: 20.79, coverCondition: [:], damagedPages: [:])]
    
    init(){
        
    }
    
    func startTracking(comicNew: ComicToBeGraded) {
        self.comicGraded = comicNew
    }
    
    func endTracking(){
        self.comicGraded = nil
    }
    
    func coverGrading(cover: Cover, condition:Condition ){
        comicGraded?.coverCondition.updateValue(condition, forKey: cover)
    }
    
    func saveComicGrading(finishedComic: ComicToBeGraded){
        if let index = allComics.firstIndex(where: {$0.id == finishedComic.id}){
            allComics[index] = finishedComic
        }else{
            allComics.append(finishedComic)
        }
        
        comicGraded = nil

    }
    
    func editComic(id: String){
        comicGraded = allComics.first(where: {$0.id == id})
    }
    
    func updateCimicGraded(update: ComicToBeGraded){
        var editedComic = update
        
        editedComic.id = comicGraded?.id ?? ""
        
        comicGraded = editedComic
        
    }
    
    func addDamagedPage(page: Int, cond: Condition){
        comicGraded?.damagedPages?.updateValue(cond, forKey: page)
    }
}
