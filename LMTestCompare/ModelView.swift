//
//  ModelView.swift
//  LMTestCompare
//
//  Created by Casey Fleser on 5/11/26.
//

import SwiftUI

// The prompt (16k tokens, thinking enabled):
// GenerateParameters(maxTokens: maxTokens, temperature: 0.2, topP: 0.9, topK: 10, minP: 0.05)
// Write a complete SwiftUI ContentView.swift for a length unit converter. It should support kilometers, miles, meters, and feet.
// Use @State for input and unit selection. No external dependencies. Think this through very carefully.
//
// Note: So because of the way I originally wrote this prompt / test the models expected to live by themselves and occasionally created
// types that collides with other results. When this happened I placed those definitions inside of an extension.

enum Model: View, CaseIterable, Identifiable {
    case devstral_sm_2_24B_4bit
    case gemma_4_e2b_it_4bit
    case qwen3_0_0_6B_4bit
    case qwen3_0_1_7B_4bit
    case qwen3_0_4B_4bit
    case qwen3_0_8B_4bit
    case qwen3_5_4B_4bit
    case qwen3_5_9B_4bit
    case qwen3_6_27B_4bit

    var id: String { name }

    var name: String {
        switch self {
        case .devstral_sm_2_24B_4bit:   "Devstral-Small-2-24B-Instruct-2512-4bit"
        case .gemma_4_e2b_it_4bit:      "Gemma-4-e2b-it-4bit"
        case .qwen3_0_0_6B_4bit:        "Qwen3-0.6B-4bit"
        case .qwen3_0_1_7B_4bit:        "Qwen3-1.7B-4bit"
        case .qwen3_0_4B_4bit:          "Qwen3-4B-4bit"
        case .qwen3_0_8B_4bit:          "Qwen3-8B-4bit"
        case .qwen3_5_4B_4bit:          "Qwen3.5-4B-8bit"
        case .qwen3_5_9B_4bit:          "Qwen3.5-9B-8bit"
        case .qwen3_6_27B_4bit:         "Qwen3.6-27B-4bit"
        }
    }

    var notes: String {
        switch self {
        case .devstral_sm_2_24B_4bit:   "❌ 3 whitespace errors. Produces decent result unclear if thinking supported? Uses Foundation's Measurement type!"
        case .gemma_4_e2b_it_4bit:      "❌ 2 errors. Also missing . before view modifiers = crashes! After fixes doesn't update on state change. Interesting design though."
        case .qwen3_0_0_6B_4bit:        "❌ thought for quite a while. eventually nonsense"
        case .qwen3_0_1_7B_4bit:        "❌ endless thinking loop. Gave up"
        case .qwen3_0_4B_4bit:          "✅ compiled! But did not function. Needed 1 line change"
        case .qwen3_0_8B_4bit:          "✅ compiled! Worked with a small issue that was corrected"
        case .qwen3_5_4B_4bit:          "✅❌ Compile but did not function and not sure what it was going for. Colorful though!"
        case .qwen3_5_9B_4bit:          "❌ 1 error which required multiple edits. Not great"
        case .qwen3_6_27B_4bit:         "✅ Very clean. 1 small issue in that swap button is invisible"
        }
    }

    // Something weird going on. Original tests were running 2.5x faster.

    var tokensPerSecond: Double {
        switch self {
        case .devstral_sm_2_24B_4bit:   18.0
        case .gemma_4_e2b_it_4bit:      49.5
        case .qwen3_0_0_6B_4bit:        89.6
        case .qwen3_0_1_7B_4bit:         0.0
        case .qwen3_0_4B_4bit:          53.6
        case .qwen3_0_8B_4bit:          46.5
        case .qwen3_5_4B_4bit:          41.5
        case .qwen3_5_9B_4bit:          28.2
        case .qwen3_6_27B_4bit:         11.4
        }
    }

    var totalTime: Double {
        switch self {
        case .devstral_sm_2_24B_4bit:    48.2
        case .gemma_4_e2b_it_4bit:       48.5
        case .qwen3_0_0_6B_4bit:         33.6
        case .qwen3_0_1_7B_4bit:          0.0
        case .qwen3_0_4B_4bit:          154.4
        case .qwen3_0_8B_4bit:           90.5
        case .qwen3_5_4B_4bit:           63.6
        case .qwen3_5_9B_4bit:           82.5
        case .qwen3_6_27B_4bit:         352.3
        }
    }

    var sizeOnDisk: Int {
        switch self {
        case .devstral_sm_2_24B_4bit:   14120980982
        case .gemma_4_e2b_it_4bit:       3613534021
        case .qwen3_0_0_6B_4bit:          349718417
        case .qwen3_0_1_7B_4bit:          982348043
        case .qwen3_0_4B_4bit:           2277304555
        case .qwen3_0_8B_4bit:           4622117343
        case .qwen3_5_4B_4bit:           5163545044
        case .qwen3_5_9B_4bit:          10453463050
        case .qwen3_6_27B_4bit:         16081502469
        }
    }

    var activeMemory: Int {
        switch self {
        case .devstral_sm_2_24B_4bit:   13511745968
        case .gemma_4_e2b_it_4bit:       2661369154
        case .qwen3_0_0_6B_4bit:          511544416
        case .qwen3_0_1_7B_4bit:                  0
        case .qwen3_0_4B_4bit:           3623652320
        case .qwen3_0_8B_4bit:           5362710512
        case .qwen3_5_4B_4bit:           4691307936
        case .qwen3_5_9B_4bit:           9698441648
        case .qwen3_6_27B_4bit:         15481461552
        }
    }

    var peakMemory: Int {
        switch self {
        case .devstral_sm_2_24B_4bit:   13837447442
        case .gemma_4_e2b_it_4bit:       3317340520
        case .qwen3_0_0_6B_4bit:          907156160
        case .qwen3_0_1_7B_4bit:                  0
        case .qwen3_0_4B_4bit:           4046322186
        case .qwen3_0_8B_4bit:           5600675364
        case .qwen3_5_4B_4bit:           5595455522
        case .qwen3_5_9B_4bit:          10493460838
        case .qwen3_6_27B_4bit:         16577321950
        }
    }

    @ViewBuilder
    var resultView: some View {
        switch self {
        case .devstral_sm_2_24B_4bit:   ResultView_Devstral_sm_2_24B_4bit()
        case .gemma_4_e2b_it_4bit:      ResultView_Gemma_4_e2b_it_4bit()
        case .qwen3_0_0_6B_4bit:        ResultView_Qwen3_0_0_6B_4bit()
        case .qwen3_0_1_7B_4bit:        ResultView_Qwen3_0_1_7B_4bit()
        case .qwen3_0_4B_4bit:          ResultView_Qwen3_0_4B_4bit()
        case .qwen3_0_8B_4bit:          ResultView_Qwen3_0_8B_4bit()
        case .qwen3_5_4B_4bit:          ResultView_Qwen3_5_4B_4bit()
        case .qwen3_5_9B_4bit:          ResultView_Qwen3_5_9B_4bit()
        case .qwen3_6_27B_4bit:         ResultView_Qwen3_6_27B_4bit()
        }
    }
    var body: some View {
        VStack {
            MetricCard(
                icon: "cpu",
                title: "Model",
                value: name
            )
            Text(notes)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)

            HStack(spacing: 12) {
                MetricCard(
                    icon: "speedometer",
                    title: "Tokens/sec",
                    value: String(format: "%.1f", tokensPerSecond)
                )
                MetricCard(
                    icon: "hourglass",
                    title: "Total Time",
                    value: String(format: "%.1fs", totalTime)
                )
            }

            HStack(spacing: 12) {
                MetricCard(
                    icon: "memorychip",
                    title: "Memory",
                    value: formatMemory(activeMemory)
                )
                MetricCard(
                    icon: "memorychip",
                    title: "Peak",
                    value: formatMemory(peakMemory)
                )
                MetricCard(
                    icon: "internaldrive",
                    title: "Size (on disk)",
                    value: formatMemory(sizeOnDisk)
                )
            }

            Divider()
            
            resultView
        }
    }

    func formatMemory(_ bytes: Int) -> String {
        let kb = Double(bytes) / 1024
        let mb = kb / 1024
        let gb = mb / 1024

        if gb >= 1 {
            return String(format: "%.2f GB", gb)
        } else if mb >= 1 {
            return String(format: "%.0f MB", mb)
        } else if kb >= 1 {
            return String(format: "%.0f KB", kb)
        } else {
            return "0 KB"
        }
    }
}
