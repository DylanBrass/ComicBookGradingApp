import SwiftUI



struct ContentView: View {
    
    @ObservedObject var comic = ComicGradingViewModel()
    @State var page = 1
    var body: some View {
      
        ZStack{

            VStack(spacing:0){
                HStack{
                    Text("Currently Grading \(comic.comicGraded?.title ?? "No Comic")").font(.title2)
                        .padding()
                    if(comic.comicGraded != nil){
                        Button(action: {
                            comic.endTracking()
                        }, label: {
                            Text("Clear")
                                .padding()
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                        })
                    }
                    
                }
                if(comic.comicGraded != nil){
                    HStack(alignment: .top){
                        if(page > 1){
                            Button{
                                    page -= 1
                            }label: {
                                Image(systemName: "arrowshape.turn.up.left.circle.fill")
                                    .padding().foregroundStyle(.white)
                                    .background(.blue)
                                    .clipShape(.circle)
                                    .scaleEffect(0.75)
                            }
                        }
                        Spacer()
                        if(page < 5){
                            Button{
                                    page += 1
                            }label: {
                                Image(systemName: "arrowshape.turn.up.right.circle.fill")
                                    .padding().foregroundStyle(.white)
                                    .background(.blue)
                                    .clipShape(.circle)
                                    .scaleEffect(0.75)

                            }
                        }
                    }
                    Divider().frame(height: 2).overlay(.black)

                    
                }
                TabView(selection: $page){
                    Group{
                        Index(comic: comic, page:$page)
                            .tabItem {
                                Label("Home", systemImage: "house")
                            }.tag(1)
                        if(comic.comicGraded != nil){
                            CoverCondition(page: $page ,comic: comic)
                                .tabItem {
                                    
                                    Label("Cover", systemImage: "book.closed")
                                }.tag(2)
                            PageDamageReport(page:$page, comic: comic)
                                .tabItem {
                                    
                                    Label("Pages", systemImage: "book")
                                }.tag(3)
                            
                            PickGrade(page: $page, comic: comic)
                                .tabItem {
                                    Label("Choose Grade", systemImage: "pencil.circle")
                                }.tag(4)
                        }
                        if(!comic.anyComics()){
                            AllComics(comicVM: comic)
                                .tabItem {
                                    Label("All Comics", systemImage: "books.vertical.fill")
                                }.tag(5)
                        }
                        
                    }
                }
            }
        }
        
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().background(Color.red)
        }
    }
}
