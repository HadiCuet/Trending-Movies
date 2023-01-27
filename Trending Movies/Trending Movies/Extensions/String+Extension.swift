//
//  String+Extension.swift
//  Trending Movies
//

import Foundation

extension String {
    func getYear(fromDateFormat format: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        guard let date = formatter.date(from: self) else {
            return nil
        }
        formatter.dateFormat = "yyyy"
        return formatter.string(from: date)
    }
}
