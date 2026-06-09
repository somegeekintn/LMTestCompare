//
//  ResultView_Foundation_macOS27.swift
//  LMTestCompare
//
//  Created by Casey Fleser on 6/9/26.
//

import SwiftUI

struct ResultView_Foundation_macOS27: View {
    // @State properties for input and unit selection
    @State var inputValue: Double = 100.0
    @State var selectedUnit: Unit = .kilometers

    // Enum for supported units
    enum Unit: String, CaseIterable {
        case kilometers = "km"
        case miles = "mi"
        case meters = "m"
        case feet = "ft"
    }

    // Conversion factors
    private let conversionFactors: [Unit: Double] = [
        .kilometers: 0.621371, // 1 km = 0.621371 mi
        .miles: 1.60934,     // 1 mi = 1.60934 km
        .meters: 0.000621371, // 1 m = 0.000621371 km
        .feet: 0.0003048     // 1 ft = 0.0003048 km
    ]

    // Computed property for converted value
    var convertedValue: Double {
        // Get conversion factor for selected unit
        let factor = conversionFactors[selectedUnit] ?? 1.0
        // Convert input value using the factor
        return inputValue * factor
    }

    // Main view
    var body: some View {
        VStack(spacing: 20) {
            // Input field
            Text("Enter length:")
                .font(.headline)
            TextField("Enter value", value: $inputValue, formatter: NumberFormatter())
//                .keyboardType(.decimal) - // Original broken bit
                .keyboardType(.decimalPad)
                .padding()
                .border(Color.gray, width: 1)

            // Unit selection
            Text("Select unit:")
                .font(.headline)
            Picker("Unit", selection: $selectedUnit) {
                // Iterate over all units and create picker options
//                ForEach(Unit.allCases) { unit in  - // Original broken bit
                ForEach(Unit.allCases, id: \.self) { unit in
                    Text(unit.rawValue)
                        .tag(unit)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            // Result display
            Text("Converted value: \(convertedValue, specifier: "%.4f")")
                .font(.largeTitle)
                .padding()
        }
        .padding()
    }
}

// Preview provider
struct ResultView_Foundation_macOS27_Previews: PreviewProvider {
    static var previews: some View {
        ResultView_Foundation_macOS27()
    }
}
