//
//  viewComicsSheet.swift
//  ComicBookGradingApp
//
//  Created by Dylan on 2023-12-09.
//

import Foundation
import SwiftUI



struct CustomButtonStyle: ButtonStyle {
    var color: Color = .green
    
    public func makeBody(configuration: CustomButtonStyle.Configuration) -> some View {
        
        configuration.label
            .foregroundColor(.white)
            .padding(15)
            .background(RoundedRectangle(cornerRadius: 5).fill(color))
            .compositingGroup()
            .shadow(color: .black, radius: 3)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}

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
                        issue.GetIssues(page: page)
                    }
                }, label: {
                    Text("Previous Page")
                        .padding()
                        
                }).buttonStyle(CustomButtonStyle(color: .blue))
                Button(action: {
                        page = page + 1
                    issue.issues = nil
                        issue.GetIssues(page: page)
                    
                }, label: {
                    Text("Next Page")
                        .padding()
                        
                }).buttonStyle(CustomButtonStyle())
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
                issue.GetIssues(page: page)
            }
        })
    }
}
