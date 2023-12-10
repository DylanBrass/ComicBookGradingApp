import SwiftUI

struct ContentView: View {
    
    @ObservedObject var comic = ComicGradingViewModel()
    @State var page = 1
    @State private var isSheetPresented = false
    
    @State private var userName: String? = UserDefaults.standard.string(forKey: "UserName")
    @State var isNameInputSheetPresented = false
    
    var body: some View {
        
        ZStack{
            
            VStack(spacing:0){
                if let userName = userName {
                    Button(action: {
                        isNameInputSheetPresented = true
                        
                    }, label: {
                        Text("Welcome, \(userName)")
                            .font(.headline)
                            .padding(.top, 5)
                    })
                    
                }
                HStack{
                    Text("Currently Grading \(comic.comicGraded?.title ?? "No Comics")").font(.subheadline)
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
        }.onAppear(perform: {
            comic.getAllComics()
            print(userName)
            isNameInputSheetPresented = userName == nil
        })
        .gesture(
            MagnificationGesture()
                .onChanged { value in
                    if value > 1.5 {
                        isSheetPresented = true
                    }
                }
        ).sheet(isPresented: $isSheetPresented) {
            ViewComicaSheet()
        }.sheet(isPresented: $isNameInputSheetPresented) {
            NameInputSheet(userName: Binding(get: {
                userName ?? ""
            }, set: { newValue in
                userName = newValue
            }))
        }

    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().background(Color.red)
        }
    }
    
    struct NameInputSheet: View {
        @Binding var userName: String
        @Environment(\.dismiss) private var dismiss

        var body: some View {
            VStack {
                TextField("Enter your name", text: $userName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Save") {
                    UserDefaults.standard.set(userName, forKey: "UserName")
                    dismiss()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding()
        }
    }

}
