//
//  TargetView.swift
//  bimyogiri
//
//  Created by alquist4121 on 2022/11/24.
//

import SwiftUI

struct TargetView: View {
    var count: Int
    
    init(_ count: Int) {
        self.count = count
    }
    
    var body: some View {
        Text(String(count))
    }
}

struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView(9)
    }
}
