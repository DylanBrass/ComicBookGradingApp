//
//  ViewModelComicGrading.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import Foundation
import SwiftUI


class ComicGradingViewModel: ObservableObject{
    
    @Published var comicGraded: ComicToBeGraded?
    
    @Published var allComics: [ComicToBeGraded] = [ComicToBeGraded(title: "Batman", number: 2, company: "DC", releaseDate: Date.now, marketPriceAtNM: 20.79, coverCondition: [:], damagedPages: [:], overall: Condition.fn, price: 10.0)]
    
    
    init(){
        
    }
 
    
    func getOverallGrade(comic: ComicToBeGraded) -> Int{
        return (comic.overallCondition!.rawValue + getAvgPageGrade(comic: comic) + getAvgCoverGrade(comic: comic)) / 3
    }
    
    private func getAvgCoverGrade(comic: ComicToBeGraded) -> Int{
        let count = comic.coverCondition.count
        var total = 0
        if(count > 0){
            for grade in comic.coverCondition.values {
                if(grade == .noneSelected){
                    total += comic.overallCondition?.rawValue ?? 0
                }
                else{
                    total += grade.rawValue
                }
            }
            print("Total for covers : \(total)")
            return total / count
        }
        return comic.overallCondition?.rawValue ?? 0
    }
    
    private func getAvgPageGrade(comic: ComicToBeGraded) -> Int{
        let count = comic.damagedPages.count
        var total = 0
        if(count > 0){
            for grade in comic.damagedPages.values {
                if(grade == .noneSelected){
                    total += comic.overallCondition?.rawValue ?? 0
                }else{
                    total += grade.rawValue
                }
            }
            print("Total for pages : \(total)")

            return total / count

        }
        
        return comic.overallCondition?.rawValue ?? 0
    }
    
    func removePage(page: Int){
        comicGraded?.damagedPages.removeValue(forKey: page)
    }
    
    func startTracking(comicNew: ComicToBeGraded) {
        self.comicGraded = comicNew
    }
    
    func endTracking(){
        self.comicGraded = nil
    }
    
    func anyComics() -> Bool{
        return allComics.isEmpty
    }
    
    func coverGrading(cover: Cover, condition:Condition ){
        comicGraded?.coverCondition.updateValue(condition, forKey: cover)
    }
    
    func saveComicGrading(grade: Condition){
        comicGraded?.overallCondition = grade
        if let index = allComics.firstIndex(where: {$0.id == self.comicGraded!.id}){
            allComics[index] = self.comicGraded!
        }else{
            allComics.append(self.comicGraded!)
        }
        comicGraded = nil
    }
    
    func editComic(id: String){
        comicGraded = allComics.first(where: {$0.id == id})
    }
    
    func updateComicGraded(update: ComicToBeGraded){
        var editedComic = update
        
        editedComic.id = comicGraded?.id ?? ""
        
        comicGraded = editedComic
        
    }
    
    
    func addDamagedPage(page: Int, cond: Condition){
        comicGraded?.damagedPages.updateValue(cond, forKey: page)
    }
}
