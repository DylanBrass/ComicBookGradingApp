//
//  viewComicsSheet.swift
//  ComicBookGradingApp
//
//  Created by Dylan on 2023-12-09.
//

import Foundation
import SwiftUI


struct ViewComicaSheet: View {
    @ObservedObject var issue = IssuesViewModel()

    @State var page: Int = 1
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            if(issue.issues?.results != nil){
                Button(action: {
                    if(page - 1 >= 1){
                        page = page - 1
                        issue.issues = nil
                        issue.testGetIssues(page: page)
                    }
                }, label: {
                    Text("Previous Page")
                        .padding()
                        
                })
                Button(action: {
                        page = page + 1
                    issue.issues = nil
                        issue.testGetIssues(page: page)
                    
                }, label: {
                    Text("Next Page")
                        .padding()
                        
                })            
                NavigationView{
                    
                    List{
                        ForEach(issue.issues!.results, id: \.id){
                            comic in
                            NavigationLink(destination: ComicDetail(comic: comic)){
                                
                                HStack{
                                    AsyncImage(url: URL(string: comic.image)) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 100)
                                                .padding()
                                        case .failure:
                                            Text("Error Loading !")
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    Text("\(comic.issue)").padding()
                                    
                                }
                            }
                        }
                    }
                }
            }
            else{
                Text("Loading...")
            }
        }.onAppear(perform: {
            if(issue.issues == nil){
                issue.testGetIssues(page: page)
            }
        })
    }
}
