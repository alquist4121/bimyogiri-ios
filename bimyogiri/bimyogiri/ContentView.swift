//
//  ContentView.swift
//  bimyogiri
//
//  Created by alquist4121 on 2022/11/08.
//

import SwiftUI

struct ContentView: View {
    @State var cnt = 0
    @ObservedObject private var viewModel: GenerateTextViewModel
    
    init(viewModel: GenerateTextViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                Text(String(cnt))
                Button(action: {
                    cnt += 1
                }) {
                    Text("count up")
                }
                NavigationLink(destination: TargetView(cnt)) {
                    Text("Open target view")
                }
                .navigationTitle("Source")
                .padding()
                Button(action: {
                    viewModel.generateButtonTapped(sentences: [
                        "swift UIのメリットとして、",
                        "Swift UIのデメリットとして、"
                    ])
                }) {
                    Text("Tap to generate text")
                }
                List {
                    ForEach(viewModel.outputs) {
                        Text($0.output)
                    }
                }
                .listStyle(.inset)
            }
            .padding()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
