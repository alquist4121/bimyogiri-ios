//
//  ContentView.swift
//  bimyogiri
//
//  Created by alquist4121 on 2022/11/08.
//

import SwiftUI

struct ContentView: View {
    @State var cnt = 0
    @State private var sentence = ""
    @State var input_sentences = [String]()
    @ObservedObject private var viewModel: GenerateTextViewModel
    
    init(viewModel: GenerateTextViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
//                Text(String(cnt))
//                Button(action: {
//                    cnt += 1
//                }) {
//                    Text("count up")
//                }
//                NavigationLink(destination: TargetView(cnt)) {
//                    Text("Open target view")
//                }
//                .navigationTitle("Source")
//                .padding()
                TextField("Type sentence to generate the rest", text: $sentence)
                Button(action: {
                    input_sentences.append(sentence)
                }) {
                    Text("tap to add text")
                }
                List {
                    ForEach(input_sentences, id: \.self) {
                        Text($0)
                    }
                    .onDelete { offSets in
                        input_sentences.remove(atOffsets: offSets)
                    }
                }
                .frame(maxHeight: 200)
                .padding()
                Button(action: {
                    viewModel.generateButtonTapped(sentences: input_sentences) {
                        input_sentences.removeAll()
                    }
                }) {
                    Text("Tap to generate text")
                }
                List {
                    ForEach(viewModel.outputs, id: \.self) { output in
                        Section {
                            ForEach(output.generated, id: \.self) { generated_sentence in
                                Text(generated_sentence)
                            }
                        } header: {
                            Text(output.original)
                        }
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
