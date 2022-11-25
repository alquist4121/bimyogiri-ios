//
//  GenerateTextViewModel.swift
//  bimyogiri
//
//  Created by alquist4121 on 2022/11/24.
//

import Foundation
import Combine

class GenerateTextViewModel: ObservableObject {
    private let generateTextApiClient: GenerateTextAPIClient
    private var cancellables = Set<AnyCancellable>()

    @Published var outputs = [GenerateTextResponseModel.Output]()

    init(generateTextApiClient: GenerateTextAPIClient = GenerateTextAPIClient.shared) {
        self.generateTextApiClient = generateTextApiClient
    }

    func generateButtonTapped(sentences: [String], callback: @escaping () -> Void) {
        generateTextApiClient
            .generateText(sentences: sentences)
            .sink { completion in
                print(completion)
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    break
                }
            } receiveValue: { model in
                print(model)
                print(model.prediction)
                self.outputs = model.prediction
                callback()
            }
            .store(in: &cancellables)
    }
}
