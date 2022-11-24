//
//  GenerateTextModel.swift
//  bimyogiri
//
//  Created by alquist4121 on 2022/11/24.
//

import Foundation

struct GenerateTextRequestModel: Codable {
    let data: [Sentence]

    enum CodingKeys: String, CodingKey {
        case data
    }
    
    struct Sentence: Codable, Equatable {
        let text: String
        
        enum CodingKeys: String, CodingKey {
            case text
        }
    }
}

struct GenerateTextResponseModel: Codable {
    let prediction: [Output]

    enum CodingKeys: String, CodingKey {
        case prediction
    }
    
    struct Output: Codable, Equatable, Identifiable {
        let id: Int
        let original: String
        let output: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case original
            case output
        }
    }
}
