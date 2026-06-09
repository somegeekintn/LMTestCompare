//
//  ResultView_Qwen3_6_27B_3bit.swift
//  LMTestCompare
//
//  Created by Casey Fleser on 6/9/26.
//

import SwiftUI

struct ResultView_Qwen3_6_27B_3bit: View {
    @State private var inputValue: String = ""
    @State private var fromUnit: LengthUnit = .kilometers
    @State private var toUnit: LengthUnit = .miles
    @State private var result: String = ""

    enum LengthUnit: String, CaseIterable {
        case kilometers = "Kilometers"
        case miles = "Miles"
        case meters = "Meters"
        case feet = "Feet"
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Length Converter")
                .font(.title)
                .fontWeight(.bold)

            TextField("Enter value", text: $inputValue)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )

            Picker("From", selection: $fromUnit) {
                ForEach(LengthUnit.allCases, id: \.rawValue) { unit in
                    Text(unit.rawValue)
                        .tag(unit)
                }
            }
            .pickerStyle(.segmented)

            Button(action: swapUnits) {
                Image(systemName: "arrow.left.arrow.right")
                    .font(.title2)
            }

            Picker("To", selection: $toUnit) {
                ForEach(LengthUnit.allCases, id: \.rawValue) { unit in
                    Text(unit.rawValue)
                        .tag(unit)
                }
            }
            .pickerStyle(.segmented)

            Text("Result: \(result)")
                .font(.title2)
                .foregroundColor(.secondary)
        }
        .padding()
        .onChange(of: inputValue) { newValue in
            convert()
        }
        .onChange(of: fromUnit) { _ in
            convert()
        }
        .onChange(of: toUnit) { _ in
            convert()
        }
    }

    private func swapUnits() {
        let temp = fromUnit
        fromUnit = toUnit
        toUnit = temp
        convert()
    }

    private func convert() {
        guard let value = Double(inputValue) else {
            result = "—"
            return
        }

        let fromFactor = fromUnit.metersPerUnit
        let toFactor = toUnit.metersPerUnit

        let resultValue = (value * fromFactor) / toFactor
        result = String(format: "%.4f", resultValue)
    }
}

// Extension to provide conversion factors
extension ResultView_Qwen3_6_27B_3bit.LengthUnit {
    var metersPerUnit: Double {
        switch self {
        case .kilometers: return 1000.0
        case .miles: return 1609.344
        case .meters: return 1.0
        case .feet: return 0.3048
        }
    }
}

#Preview {
    ResultView_Qwen3_6_27B_3bit()
}
