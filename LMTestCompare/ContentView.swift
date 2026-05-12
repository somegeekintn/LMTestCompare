//
//  ContentView.swift
//  LMTestCompare
//
//  Created by Casey Fleser on 5/11/26.
//

import SwiftUI

struct ContentView: View {
    @State var model: Model = .qwen3_0_0_6B_4bit

    var body: some View {
        ScrollView {
            VStack {
                Picker("Model", selection: $model) {
                    ForEach(Model.allCases) { model in
                        Text(model.name).tag(model)
                    }
                }
                .pickerStyle(.menu)

                Divider()

                model

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

