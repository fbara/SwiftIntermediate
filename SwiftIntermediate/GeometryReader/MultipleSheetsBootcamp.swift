//
//  MultipleSheetsBootcamp.swift
//  SwiftIntermediate
//
//  Created by Frank Bara on 12/2/21.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1 - Binding
// 2 - Multiple .sheet
// 3 - use $item

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel? = nil
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                
                ForEach(0..<50) { index in
                    Button("Button #\(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
            }
        }
        
        
    }
}

struct NextScreen: View {
    // #1
    //    @Binding var selectedModel: RandomModel
    
    // #2
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
