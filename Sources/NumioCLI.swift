// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

@main
struct NumioCLI: ParsableCommand {
    @Argument(help: "Start time in HH:mm or HH format")
    var startTime: String
    
    @Argument(help: "Operator, '+' or '-'")
    var operatorSymbol: String
    
    @Argument(help: "Time to add or subtract in HH:mm or HH format")
    var addTime: String
    
    func run() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        func normalizeTime(_ time: String) -> String {
            return time.contains(":") ? time : "\(time):00"
        }
        
        let normalizedStartTime = normalizeTime(startTime)
        guard let startDate = dateFormatter.date(from: normalizedStartTime) else {
            throw ValidationError("Invalid start time format. Use HH:mm or HH")
        }
        
        let normalizedAddTime = normalizeTime(addTime)
        guard let addDate = dateFormatter.date(from: normalizedAddTime) else {
            throw ValidationError("Invalid time format for the operation. Use HH:mm")
        }
        
        let calendar = Calendar.current
        let addComponents = calendar.dateComponents([.hour, .minute], from: addDate)
        
        var resultDate: Date?
        
        // Handle the operation based on the operator
        if operatorSymbol == "-" {
            // Create negative components for subtraction
            let negativeAddComponents = DateComponents(hour: -addComponents.hour!, minute: -addComponents.minute!)
            resultDate = calendar.date(byAdding: negativeAddComponents, to: startDate)
        } else if operatorSymbol == "+" {
            resultDate = calendar.date(byAdding: addComponents, to: startDate)
        } else {
            throw ValidationError("Invalid operator. Use '+' or '-'")
        }
        
        guard let finalDate = resultDate else {
            throw ValidationError("Time calculation error")
        }
        
        print(dateFormatter.string(from: finalDate))
    }
}
