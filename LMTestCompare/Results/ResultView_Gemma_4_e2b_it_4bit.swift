//
//  ResultView_Gemma_4_e2b_it_4bit.swift
//  LMTestCompare
//
//  Created by Casey Fleser on 5/11/26.
//

import SwiftUI

/* Original
struct ResultView_Gemma_4_e2b_it_4bit: View {
    // MARK: - State Variables
    @State private var inputValue: Double = 10.0
    @State private var sourceUnit: Unit =.kilometer
    @State private var targetUnit: Unit =.mile
    @State private var result: Double = 0.0

    // MARK: - Conversion Constants
    // Define conversion factors relative to a base unit (Meters)
    private struct ConversionFactors {
        static let kmToM = 1000.0
        static let miToM = 1609.34 // 1 mile = 1609.34 meters
        static let mToM = 1.0
        static let ftToM = 0.3048 // 1 foot = 0.3048 meters
    }

    // MARK: - Conversion Logic
    
    /// Converts the input value from the source unit to the target unit.
    private func calculateConversion() {
        let valueInMeters: Double
        
        // 1. Convert input value to the base unit (Meters)
        switch sourceUnit {
        case.kilometer:
            valueInMeters = inputValue * ConversionFactors.kmToM
        case.mile:
            valueInMeters = inputValue * ConversionFactors.miToM
        case.meter:
            valueInMeters = inputValue
        case.foot:
            // If input is in feet, convert to meters
            valueInMeters = inputValue * ConversionFactors.ftToM
        }
        
        // 2. Convert from the base unit (Meters) to the target unit
        switch targetUnit {
        case.kilometer:
            result = valueInMeters / ConversionFactors.kmToM
        case.mile:
            result = valueInMeters / ConversionFactors.miToM
        case.meter:
            result = valueInMeters / ConversionFactors.mToM
        case.foot:
            // If target is feet, convert meters to feet
            result = valueInMeters / ConversionFactors.ftToM
        }
    }
    
    // MARK: - UI Helpers
    
    /// Converts the displayed result back to a readable string.
    private func formatResult(_ value: Double) -> String {
        return String(format: "%.4f", value)
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text("📏 Length Converter 🧚")
                font(.largeTitle)
                fontWeight(.bold)
            
            // --- Input Section ---
            VStack(alignment:.leading, spacing: 10) {
                Text("Enter Value:")
                
                Picker("Input Unit", selection: $sourceUnit) {
                    Text("Kilometer (km)").tag(Unit.kilometer)
                    Text("Mile (mi)").tag(Unit.mile)
                    Text("Meter (m)").tag(Unit.meter)
                    Text("Foot (ft)").tag(Unit.foot)
                }
                pickerStyle(.segmented)
                padding(.horizontal)
                
                TextField("Value", value: $inputValue, formatter: NumberFormatter())
                    keyboardType(.decimalPad)
                    textFieldStyle(.roundedBorder)
                    padding(.horizontal)
            }
            padding()
            
            // --- Output Section ---
            VStack(alignment:.leading, spacing: 10) {
                Text("Convert To:")
                
                Picker("Output Unit", selection: $targetUnit) {
                    Text("Kilometer (km)").tag(Unit.kilometer)
                    Text("Mile (mi)").tag(Unit.mile)
                    Text("Meter (m)").tag(Unit.meter)
                    Text("Foot (ft)").tag(Unit.foot)
                }
                pickerStyle(.segmented)
                padding(.horizontal)
                
                Text("Result:")
                    font(.headline)
                
                Text(formatResult(result))
                    font(.system(size: 36, weight:.heavy, design:.rounded))
                    foregroundColor(.green)
            }
            padding()
            
            Spacer()
        }
        padding()
        onAppear {
            // Initialize result when the view first appears
            calculateConversion()
        }
    }
}

// MARK: - Helper Enum for Clarity
enum Unit {
    case kilometer, mile, meter, foot
}
*/

struct ResultView_Gemma_4_e2b_it_4bit: View {
    // MARK: - State Variables
    @State private var inputValue: Double = 10.0
    @State private var sourceUnit: Unit = .kilometer
    @State private var targetUnit: Unit = .mile
    @State private var result: Double = 0.0

    // MARK: - Conversion Constants
    // Define conversion factors relative to a base unit (Meters)
    private struct ConversionFactors {
        static let kmToM = 1000.0
        static let miToM = 1609.34 // 1 mile = 1609.34 meters
        static let mToM = 1.0
        static let ftToM = 0.3048 // 1 foot = 0.3048 meters
    }

    // MARK: - Conversion Logic
    
    /// Converts the input value from the source unit to the target unit.
    private func calculateConversion() {
        let valueInMeters: Double
        
        // 1. Convert input value to the base unit (Meters)
        switch sourceUnit {
        case.kilometer:
            valueInMeters = inputValue * ConversionFactors.kmToM
        case.mile:
            valueInMeters = inputValue * ConversionFactors.miToM
        case.meter:
            valueInMeters = inputValue
        case.foot:
            // If input is in feet, convert to meters
            valueInMeters = inputValue * ConversionFactors.ftToM
        }
        
        // 2. Convert from the base unit (Meters) to the target unit
        switch targetUnit {
        case.kilometer:
            result = valueInMeters / ConversionFactors.kmToM
        case.mile:
            result = valueInMeters / ConversionFactors.miToM
        case.meter:
            result = valueInMeters / ConversionFactors.mToM
        case.foot:
            // If target is feet, convert meters to feet
            result = valueInMeters / ConversionFactors.ftToM
        }
    }
    
    // MARK: - UI Helpers
    
    /// Converts the displayed result back to a readable string.
    private func formatResult(_ value: Double) -> String {
        return String(format: "%.4f", value)
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text("📏 Length Converter 🧚")
                .font(.largeTitle)
                .fontWeight(.bold)

            // --- Input Section ---
            VStack(alignment:.leading, spacing: 10) {
                Text("Enter Value:")
                
                Picker("Input Unit", selection: $sourceUnit) {
                    Text("Kilometer (km)").tag(Unit.kilometer)
                    Text("Mile (mi)").tag(Unit.mile)
                    Text("Meter (m)").tag(Unit.meter)
                    Text("Foot (ft)").tag(Unit.foot)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                TextField("Value", value: $inputValue, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }
            .padding()

            // --- Output Section ---
            VStack(alignment:.leading, spacing: 10) {
                Text("Convert To:")
                
                Picker("Output Unit", selection: $targetUnit) {
                    Text("Kilometer (km)").tag(Unit.kilometer)
                    Text("Mile (mi)").tag(Unit.mile)
                    Text("Meter (m)").tag(Unit.meter)
                    Text("Foot (ft)").tag(Unit.foot)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                Text("Result:")
                    .font(.headline)

                Text(formatResult(result))
                    .font(.system(size: 36, weight:.heavy, design:.rounded))
                    .foregroundColor(.green)
            }
            .padding()

            Spacer()
        }
        .padding()
        .onAppear {
            // Initialize result when the view first appears
            calculateConversion()
        }
    }
}

extension ResultView_Gemma_4_e2b_it_4bit {
    // MARK: - Helper Enum for Clarity
    enum Unit {
        case kilometer, mile, meter, foot
    }
}

// MARK: - Preview
struct ResultView_Gemma_4_e2b_it_4bit_Previews: PreviewProvider {
    static var previews: some View {
        ResultView_Gemma_4_e2b_it_4bit()
    }
}
