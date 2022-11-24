//
//  GenerateTextAPIClient.swift
//  bimyogiri
//
//  Created by alquist4121 on 2022/11/24.
//

import Foundation
import Combine

protocol GenerateTextAPIClientProtocol: AnyObject {
    func generateText(sentences: [String]) -> AnyPublisher<GenerateTextResponseModel, Error>
}

final class GenerateTextAPIClient: GenerateTextAPIClientProtocol {
    static let shared = GenerateTextAPIClient()
    private init() {}

    func generateText(sentences: [String]) -> AnyPublisher<GenerateTextResponseModel, Error> {
        let url = URL(string: "http://127.0.0.1:8000/prediction")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let params = GenerateTextRequestModel(data: sentences.map {GenerateTextRequestModel.Sentence(text: $0)})
        let encoder = JSONEncoder()
        let data = try? encoder.encode(params)
        request.httpBody = data
//        assert(JSONSerialization.isValidJSONObject(data))
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: data, options: []) else { return Fail(error: NSError(domain: "", code: -10001, userInfo: nil)).eraseToAnyPublisher() }
//        request.httpBody = httpBody
        

        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: GenerateTextResponseModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
