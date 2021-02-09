//
//  DateFormatterManager.swift
//  Notiz
//
//  Created by Ramy Sabry on 09/02/2021.
//

import Foundation
import UIKit



enum CustomDateFormateTypeEnum {
    case NormalStringDate
    case TodayFormateStringDate
}

struct DateFormatterManager {
    
    static func getFormattedStringDateFromISOdate(isoDate: String = getCurrentDateInISOFormate(),
                                                  dateInputFormate: String = "yyyy-MM-ddTHH:mm",
                                                  dateOutputFormate: String,
                                                  outputType: CustomDateFormateTypeEnum) -> String {
        
        let inputFormatter = ISO8601DateFormatter()
        inputFormatter.formatOptions = [.withFullDate,
        .withTime,
        .withDashSeparatorInDate,
        .withColonSeparatorInTime]
       
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = dateOutputFormate
        outputFormatter.timeZone = TimeZone(abbreviation: "UTC")

        if let showDate = inputFormatter.date(from: isoDate) {
            if outputType == .NormalStringDate {
                let resultString = outputFormatter.string(from: showDate)
                return resultString
            }
            else {
                if Calendar.current.isDateInToday(showDate) {
                    return "Today"
                }
                else if Calendar.current.isDateInYesterday(showDate) {
                    return "Yesterday"
                }
                else {
                    let resultString = outputFormatter.string(from: showDate)
                    return resultString
                }
            }
        }
        else {
            let formatter = DateFormatter()
            formatter.dateFormat = dateOutputFormate
            formatter.timeZone = TimeZone(abbreviation: "UTC")
            let stringDate = formatter.string(from: Date())
            return stringDate
        }
    }
    
    static func getCurrentDateInISOFormate() -> String {
        let formatter = ISO8601DateFormatter()
        let string = formatter.string(from: Date())
        return string
    }
    
}



