//
//  ResultView_Devstral_sm_2_24B_4bit.swift
//  LMTestCompare
//
//  Created by Casey Fleser on 5/11/26.
//

import SwiftUI

struct ResultView_Devstral_sm_2_24B_4bit: View {
    // Input value and selected units
    @State private var inputValue: Double = 0
    @State private var inputUnit: UnitLength = .kilometers          // Corrected to add whitespace
    @State private var outputUnit: UnitLength = .miles              // Corrected to add whitespace

    // Available units
    let units:[UnitLength] = [.kilometers,.miles,.meters,.feet]     // Corrected to add whitespace

    var body: some View {
        VStack(spacing: 20) {
            // Input section
            VStack {
                TextField("Enter value", value: $inputValue, format:.number)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .keyboardType(.decimalPad)

                Picker("Input Unit", selection: $inputUnit) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit.symbol).tag(unit)
                    }
                }
               .pickerStyle(SegmentedPickerStyle())
            }

            // Conversion result
            Text("Result: \(convertedValue, specifier: "%.2f") \(outputUnit.symbol)")
               .font(.title2)

            // Output unit selection
            Picker("Output Unit", selection: $outputUnit) {
                ForEach(units, id: \.self) { unit in
                    Text(unit.symbol).tag(unit)
                }
            }
           .pickerStyle(SegmentedPickerStyle())
        }
       .padding()
    }

    // Calculate the converted value
    var convertedValue: Double {
        let inputMeasurement = Measurement(value: inputValue, unit: inputUnit)
        return inputMeasurement.converted(to: outputUnit).value
    }
}

struct ResultView_Devstral_sm_2_24B_4bit_Previews: PreviewProvider {
    static var previews: some View {
        ResultView_Devstral_sm_2_24B_4bit()
    }
}
