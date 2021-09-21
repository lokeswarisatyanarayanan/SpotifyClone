//
//  Calendar+Extension.swift
//  Calendar+Extension
//
//  Created by Lokeswari Satyanarayana on 12/09/21.
//

import Foundation

func timeGreeting() -> String {
    let hour = Calendar.current.component(.hour, from: Date())
    if hour >= 0 && hour < 12 {
        return "Good Morning"
    } else if hour >= 12 && hour < 17 {
        return "Good Afternoon"
    } else {
        return "Good Evening"
    }
}
