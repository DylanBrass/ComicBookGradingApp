import SwiftUI



struct ContentView: View {
    
    @ObservedObject var comic = ComicGradingViewModel()
    
    var body: some View {
        VStack{
            
            TabView {
                Index(comic: comic)
                    .tabItem {
                        
                Label("Home", systemImage: "house")
                    }
                CoverCondition()
                    .tabItem {
                        
                        Label("Cover", systemImage: "book.closed")
                    }
                
                PageDamageReport(comic: comic)
                    .tabItem {
                        
                        Label("Pages", systemImage: "book")
                    }
                
                PickGrade()
                    .tabItem {
                        Label("Choose Grade", systemImage: "pencil.circle")
                    }
                
                AllComics()
                    .tabItem {
                        Label("All Comics", systemImage: "books.vertical.fill")
                    }
            }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }
}
