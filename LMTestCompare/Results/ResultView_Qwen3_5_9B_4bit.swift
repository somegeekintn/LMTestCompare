//
//  ResultView_Qwen3_5_9B_4bit.swift
//  LMTestCompare
//
//  Created by Casey Fleser on 5/11/26.
//

import SwiftUI

struct ResultView_Qwen3_5_9B_4bit: View {
//    @State private var inputValue: Double = 1     - Original
    @State private var inputValue: String = "1"     // Corrected
    @State private var fromUnit: LengthUnit = .kilometers
    @State private var toUnit: LengthUnit = .miles
    
    enum LengthUnit: String, CaseIterable {
        case kilometers = "km"
        case miles = "mi"
        case meters = "m"
        case feet = "ft"
        
        var displayName: String {
            switch self {
            case .kilometers: return "Kilometers"
            case .miles: return "Miles"
            case .meters: return "Meters"
            case .feet: return "Feet"
            }
        }
        
        var metersPerUnit: Double {
            switch self {
            case .kilometers: return 1000
            case .miles: return 1609.344
            case .meters: return 1
            case .feet: return 0.3048
            }
        }
    }
    
    var inputDouble: Double { Double(inputValue) ?? 0 }             // Correction

    var convertedValue: Double {
//        let valueInMeters = inputValue * fromUnit.metersPerUnit   - Original
        let valueInMeters = inputDouble * fromUnit.metersPerUnit    // Correction
        return valueInMeters / toUnit.metersPerUnit
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Length Converter")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 15) {
                // Input field
                HStack {
                    Text("Value")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter value", text: $inputValue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: .infinity)
                }
                
                // From unit picker
                Picker("From Unit", selection: $fromUnit) {
                    ForEach(LengthUnit.allCases, id: \.self) { unit in
                        Text(unit.displayName)
                            .tag(unit)
                    }
                }
                .pickerStyle(.menu)
                .padding(.horizontal)
                
                // To unit picker
                Picker("To Unit", selection: $toUnit) {
                    ForEach(LengthUnit.allCases, id: \.self) { unit in
                        Text(unit.displayName)
                            .tag(unit)
                    }
                }
                .pickerStyle(.menu)
                .padding(.horizontal)
                
                // Result display
                VStack {
                    Text("Result")
                        .font(.headline)
                    
                    Text("\(String(format: "%.6f", convertedValue)) \(toUnit.rawValue)")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 5)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
