import SwiftUI


struct AllComics: View {

    @ObservedObject var comicVM: ComicGradingViewModel
    @State private var edit: Bool = false

    var body: some View {
        VStack {
            Toggle("Edit Mode", isOn: $edit)
                .padding()

            Text("All Previously Graded Comics")
                .font(.title)
                .padding(.top, 4)

            List {
                ForEach(comicVM.allComics, id: \.id) { comic in
                    Button(action: {
                        comicVM.editComic(id: comic.id)
                    }, label: {
                        HStack {
                            Text("\(comic.title) : \(Condition.getNameFromValue(value:comicVM.getOverallGrade(comic: comic)))")
                                .foregroundStyle(.black)
                                .padding()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            Spacer()
                            Button(action: {
                                comicVM.deleteComic(id: comic.id)
                            }, label: {
                                Image(systemName: "delete.left.fill")
                                    .padding()
                                    .foregroundStyle(.white)
                                    .background(.blue)
                                    .clipShape(Circle())
                            }).disabled(!edit)
                        }

                    }).disabled(!edit).background(edit ? Color.clear : Color.gray.opacity(0.5))
                }
            }
        }
    }
}
