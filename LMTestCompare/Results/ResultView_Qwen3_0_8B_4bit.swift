//
//  ResultView_Qwen3_0_8B_4bit.swift
//  LMTestCompare
//
//  Created by Casey Fleser on 5/11/26.
//

import SwiftUI

struct ResultView_Qwen3_0_8B_4bit: View {
    @State private var input: String = ""
    @State private var selectedUnit: Unit = .kilometers
    
    var body: some View {
        VStack {
            TextField("Enter value", text: $input)
                .keyboardType(.decimalPad)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
            
            Picker("Select Unit", selection: $selectedUnit) {
                ForEach(Unit.allCases, id: \.self) { unit in
                    Text(unit.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            // Display converted values
            ForEach(Unit.allCases, id: \.self) { unit in
//                Text("\(convertToUnit(unit: unit, value: input)) $unit.rawValue") - Original broken bit
                Text("\(convertToUnit(unit: unit, value: input)) \(unit.rawValue)")
            }
        }
        .padding()
    }
    
    func convertToUnit(unit: Unit, value: String) -> String {
        guard let inputValue = Double(value) else { return "0" }
        let convertedValue = convertFromSelectedUnitTo(unit: unit, value: inputValue)
        return String(convertedValue)
    }
    
    func convertFromSelectedUnitTo(unit: Unit, value: Double) -> Double {
        let meters = convertValueToMeters(unit: selectedUnit, value: value)
        switch unit {
        case .kilometers:
            return meters / 1000
        case .miles:
            return meters * 0.000539957
        case .meters:
            return meters
        case .feet:
            return meters * 3.28084
        }
    }
    
    func convertValueToMeters(unit: Unit, value: Double) -> Double {
        switch unit {
        case .kilometers:
            return value * 1000
        case .miles:
            return value * 1609.34
        case .meters:
            return value
        case .feet:
            return value * 0.3048
        }
    }
}

extension ResultView_Qwen3_0_8B_4bit {
    enum Unit: String, CaseIterable {
        case kilometers = "Kilometers"
        case miles = "Miles"
        case meters = "Meters"
        case feet = "Feet"
    }
}

