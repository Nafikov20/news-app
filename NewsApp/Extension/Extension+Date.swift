//
//  Extentions+Date.swift
//  NewsApp
//
//  Created by Ильхам  on 13.11.2026.
//

import Foundation


extension Date {
    func convertDate() -> String {
        return formatted(.dateTime.hour().minute().day().month().year())
    }
}
