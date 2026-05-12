//
//  ResultView_Qwen3_5_4B_4bit.swift
//  LMTestCompare
//
//  Created by Casey Fleser on 5/11/26.
//

import SwiftUI

struct ResultView_Qwen3_5_4B_4bit: View {
    @State private var inputValue: Double = 0
    @State private var fromUnit: String = "kilometers"
    @State private var toUnit: String = "meters"
    @State private var convertedValue: Double = 0
    
    private let units = ["kilometers", "meters", "feet", "miles"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                // Input Section
                Text("Length Converter")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                HStack {
                    Text("From:")
                        .font(.headline)
                    Spacer()
                    Text(fromUnit)
                        .font(.headline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8)
                }
                
                HStack {
                    Text("Value:")
                        .font(.headline)
                    Spacer()
                    TextField("", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .font(.title)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8)
                }
                
                // Conversion Display
                Text("Converted to:")
                    .font(.headline)
                
                HStack {
                    Text(convertedValue, format: .number)
                        .font(.title)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(8)
                    Spacer()
                    Text(toUnit)
                        .font(.headline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(8)
                }
                
                // Unit Selection
                VStack(alignment: .leading, spacing: 12) {
                    Text("Select Units")
                        .font(.headline)
                    
                    ForEach(units, id: \.self) { unit in
                        Button(action: {
                            if unit == fromUnit {
                                toUnit = unit
                            } else {
                                fromUnit = unit
                            }
                        }) {
                            HStack {
                                Text(unit)
                                    .fontWeight(.medium)
                                Spacer()
                                if unit == fromUnit {
                                    Image(systemName: "arrow.down.circle.fill")
                                        .font(.title2)
                                } else if unit == toUnit {
                                    Image(systemName: "arrow.up.circle.fill")
                                        .font(.title2)
                                } else {
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.title2)
                                }
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(unit == fromUnit ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                            .cornerRadius(8)
                        }
                    }
                }
                
                Spacer()
                
                // Info
                Text("No external dependencies")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom)
            }
            .padding()
            .background(Color(.systemBackground))
            .navigationTitle("Length Converter")
        }
    }
}

// MARK: - Conversion Logic
extension ResultView_Qwen3_5_4B_4bit {
    private func convert(from: Double, fromUnit: String, toUnit: String) -> Double {
        let meters: Double
        switch fromUnit {
        case "kilometers":
            meters = from * 1000
        case "meters":
            meters = from
        case "feet":
            meters = from * 0.3048
        case "miles":
            meters = from * 1609.344
        default:
            meters = 0
        }
        
        switch toUnit {
        case "kilometers":
            return meters / 1000
        case "meters":
            return meters
        case "feet":
            return meters / 0.3048
        case "miles":
            return meters / 1609.344
        default:
            return 0
        }
    }
}

// MARK: - Preview
struct ResultView_Qwen3_5_4B_4bit_Previews: PreviewProvider {
    static var previews: some View {
        ResultView_Qwen3_5_4B_4bit()
    }
}

