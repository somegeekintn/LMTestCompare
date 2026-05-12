//
//  ResultView_Qwen3_6_27B_4bit.swift
//  LMTestCompare
//
//  Created by Casey Fleser on 5/11/26.
//

import SwiftUI

struct ResultView_Qwen3_6_27B_4bit: View {
    @State private var inputValue: String = ""
    @State private var fromUnit: LengthUnit = .meter
    @State private var toUnit: LengthUnit = .foot
    
    private var numericValue: Double {
        Double(inputValue) ?? 0
    }
    
    private var convertedValue: Double {
        let meters = numericValue * fromUnit.toMeters
        return meters / toUnit.toMeters
    }
    
    private var formattedResult: String {
        if inputValue.isEmpty {
            return "—"
        }
        return String(format: "%.4g", convertedValue)
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Length Converter")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 16) {
                TextField("Enter value", text: $inputValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
                
                Picker("From", selection: $fromUnit) {
                    ForEach(LengthUnit.allCases) { unit in
                        Text(unit.rawValue).tag(unit)
                    }
                }
                .pickerStyle(.segmented)
                
                Button(action: swapUnits) {
                    Image(systemName: "arrow.left.right")
                        .font(.title)
                }

                Picker("To", selection: $toUnit) {
                    ForEach(LengthUnit.allCases) { unit in
                        Text(unit.rawValue).tag(unit)
                    }
                }
                .pickerStyle(.segmented)
            }
            .padding(.horizontal)
            
            VStack(spacing: 8) {
                Text("Result")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text(formattedResult)
                    .font(.title)
                    .fontWeight(.bold)
                
                if !inputValue.isEmpty {
                    Text(toUnit.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            .padding(.horizontal)
        }
        .padding()
    }
    
    private func swapUnits() {
        let temp = fromUnit
        fromUnit = toUnit
        toUnit = temp
    }
}

extension ResultView_Qwen3_6_27B_4bit {
    enum LengthUnit: String, CaseIterable, Identifiable {
        case kilometer = "Kilometers"
        case mile = "Miles"
        case meter = "Meters"
        case foot = "Feet"

        var id: String { rawValue }

        var toMeters: Double {
            switch self {
            case .kilometer: return 1000.0
            case .mile: return 1609.344
            case .meter: return 1.0
            case .foot: return 0.3048
            }
        }
    }
}

#Preview {
    ContentView()
}
