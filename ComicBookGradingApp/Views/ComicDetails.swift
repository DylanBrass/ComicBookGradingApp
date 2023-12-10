//
//  ComicDetails.swift
//  ComicBookGradingApp
//
//  Created by Dylan on 2023-12-09.
//

import Foundation
import SwiftUI

struct ComicDetail: View {
    @State var comic: IssueResult
    var body: some View {
        VStack{
            List{
                AsyncImage(url: URL(string: comic.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                            .padding()
                    case .failure:
                        Text("Error Loading !")
                    @unknown default:
                        EmptyView()
                    }
                }
                Text("ID : \(comic.id)")
                Text("Name : \(comic.issue)")
                Text("Number : \(comic.number)")
                Text("Cover date : \(comic.cover_date)")
                
                HStack{
                    Text("Series: \(comic.series.name)").padding()
                    Text("Debut date :" + String(comic.series.year_began)).padding()
                }
                HStack{
                    Text("Volume : \(comic.series.volume)").padding()
                }
            }
        }
    }
}
