//
//  HashableBootcamp.swift
//  SwiftIntermediate
//
//  Created by Frank Bara on 12/6/21.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "One"),
        MyCustomModel(title: "Two"),
        MyCustomModel(title: "Three"),
        MyCustomModel(title: "Four"),
        MyCustomModel(title: "Five")
    ]
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 40) {
                
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                }
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
