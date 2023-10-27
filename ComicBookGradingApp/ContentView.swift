import SwiftUI



struct ContentView: View {
    
    @ObservedObject var comic = ComicGradingViewModel()

    var body: some View {
      
        ZStack{

            VStack{
                Text("Currently Grading \(comic.comicGraded?.title ?? "No Comic")")

                TabView {
                    Group{
                        Index(comic: comic)
                            .tabItem {
                                Label("Home", systemImage: "house")
                            }
                        CoverCondition(comic: comic)
                            .tabItem {
                                
                                Label("Cover", systemImage: "book.closed")
                            }
                        PageDamageReport(comic: comic)
                            .tabItem {
                                
                                Label("Pages", systemImage: "book")
                            }
                        
                        PickGrade(comic: comic)
                            .tabItem {
                                Label("Choose Grade", systemImage: "pencil.circle")
                            }
                        
                        AllComics(comicVM: comic)
                            .tabItem {
                                Label("All Comics", systemImage: "books.vertical.fill")
                            }
                    }
                }
            }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color(#colorLiteral(red: 0.8, green: 0.6, blue: 0.6, alpha: 1)))
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color(#colorLiteral(red: 0.8, green: 0.6, blue: 0.6, alpha: 1)))
        
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().background(Color.red)
        }
    }
}
