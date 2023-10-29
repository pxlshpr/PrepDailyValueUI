import SwiftUI
import PrepShared

struct RDIPicker: View {
    
    let micro: Micro
    @State var model = Model()
    
    @Observable class Model {
        var presentedURLString: String? = nil
        var showingWebView: Bool = false
    }
    
    var body: some View {
        Form {
            ForEach(micro.rdis, id: \.self) {
                RDISection(rdi: $0)
                    .environment(model)
            }
        }
        .navigationTitle(micro.name)
        .sheet(isPresented: $model.showingWebView) { urlView }
    }
    
    @ViewBuilder
    var urlView: some View {
        if let urlString = model.presentedURLString {
            NavigationStack {
                WebView(urlString: urlString, title: "Source")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                model.showingWebView = false
                                model.presentedURLString = nil
                            } label: {
                                Text("Done")
                                    .fontWeight(.bold)
                            }
                        }
                    }
            }
        }
    }
}
