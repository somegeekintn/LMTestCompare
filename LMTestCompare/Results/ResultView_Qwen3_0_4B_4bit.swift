//
//  ResultView_Qwen3_0_4B_4bit.swift
//  LMTestCompare
//
//  Created by Casey Fleser on 5/11/26.
//

import SwiftUI

struct ResultView_Qwen3_0_4B_4bit: View {
    @State private var input: String = ""
    @State private var selectedUnit: Unit = .meter
    
    var body: some View {
        VStack {
            TextField("Enter value", text: $input)
                .keyboardType(.decimalPad)
                .padding()
            
            Picker("Select unit", selection: $selectedUnit) {
                ForEach(Unit.allCases, id: \.self) { unit in
                    Text(unit.rawValue).tag(unit)
                }
            }
            .padding()
            
            ForEach(Unit.allCases, id: \.self) { unit in
                if unit != selectedUnit {
                    let convertedValue = convertValue(from: selectedUnit, value: Double(input) ?? 0.0, to: unit)
//                    Text("\(unit.rawValue): $convertedValue") // Original broken bit
                    Text("\(unit.rawValue): \(convertedValue)") // Corrected
                }
            }
        }
    }
    
    func convertValue(from fromUnit: Unit, value: Double, to toUnit: Unit) -> Double {
        let meters = convertToMeters(from: fromUnit, value: value)
        return convertFromMeters(to: toUnit, value: meters)
    }
    
    func convertToMeters(from unit: Unit, value: Double) -> Double {
        switch unit {
        case .kilometer:
            return value / 1000
        case .mile:
            return value / 1609.34
        case .meter:
            return value
        case .foot:
            return value / 0.3048
        }
    }
    
    func convertFromMeters(to unit: Unit, value: Double) -> Double {
        switch unit {
        case .kilometer:
            return value * 1000
        case .mile:
            return value * 1609.34
        case .meter:
            return value
        case .foot:
            return value * 0.3048
        }
    }
}

extension ResultView_Qwen3_0_4B_4bit {
    enum Unit: String, CaseIterable {
        case kilometer = "km"
        case mile = "mi"
        case meter = "m"
        case foot = "ft"
    }
}
