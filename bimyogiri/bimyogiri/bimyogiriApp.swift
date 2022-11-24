//
//  bimyogiriApp.swift
//  bimyogiri
//
//  Created by alquist4121 on 2022/11/08.
//

import SwiftUI

@main
struct bimyogiriApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: GenerateTextViewModel())
        }
    }
}
