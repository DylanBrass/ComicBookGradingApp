import SwiftUI



struct ContentView: View {
    var body: some View {
        VStack{
            
            TabView {
                Index()
                    .tabItem {
                        
                Label("Home", systemImage: "house")
                    }
                CoverCondition()
                    .tabItem {
                        
                        Label("Cover", systemImage: "book.closed")
                    }
                PageDamageReport()
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
