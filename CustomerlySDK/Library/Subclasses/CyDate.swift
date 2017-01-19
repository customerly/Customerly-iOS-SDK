//
//  CyDate.swift
//  Customerly
//
//  Created by Paolo Musolino on 28/11/16.
//  Copyright © 2016 Customerly. All rights reserved.
//

import UIKit

extension Date {
    
    static func timeAgoSinceUnixTime(unix_time: Double, currentDate: Date) -> String{
        return timeAgoSinceDate(Date(timeIntervalSince1970:TimeInterval(unix_time)), currentDate: currentDate)
    }
    
    static func timeAgoSinceDate(_ date: Date, currentDate: Date) -> String {
        let calendar = Calendar.current
        let now = currentDate
        let earliest = (now as NSDate).earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.minute , NSCalendar.Unit.hour , NSCalendar.Unit.day , NSCalendar.Unit.weekOfYear , NSCalendar.Unit.month , NSCalendar.Unit.year , NSCalendar.Unit.second], from: earliest, to: latest, options: NSCalendar.Options())
        
        if (components.year! >= 2) {
            return String.localizedStringWithFormat("timeAgoSinceDate_yearsAgo %d".localized(comment: "Time Ago Since Date"),  components.year!)
        } else if (components.year! >= 1){
            return String.localizedStringWithFormat("timeAgoSinceDate_yearAgo %d".localized(comment: "Time Ago Since Date"),  components.year!)
        } else if (components.month! >= 2) {
            return String.localizedStringWithFormat("timeAgoSinceDate_monthsAgo %d".localized(comment: "Time Ago Since Date"),  components.month!)
        } else if (components.month! >= 1){
            return String.localizedStringWithFormat("timeAgoSinceDate_monthAgo %d".localized(comment: "Time Ago Since Date"),  components.month!)
        } else if (components.weekOfYear! >= 2) {
            return String.localizedStringWithFormat("timeAgoSinceDate_weeksAgo %d".localized(comment: "Time Ago Since Date"),  components.weekOfYear!)
        } else if (components.weekOfYear! >= 1){
            return String.localizedStringWithFormat("timeAgoSinceDate_weekAgo %d".localized(comment: "Time Ago Since Date"),  components.weekOfYear!)
        } else if (components.day! >= 2) {
            return String.localizedStringWithFormat("timeAgoSinceDate_daysAgo %d".localized(comment: "Time Ago Since Date"),  components.day!)
        } else if (components.day! >= 1){
            return String.localizedStringWithFormat("timeAgoSinceDate_dayAgo %d".localized(comment: "Time Ago Since Date"),  components.day!)
        } else if (components.hour! >= 2) {
            return String.localizedStringWithFormat("timeAgoSinceDate_hoursAgo %d".localized(comment: "Time Ago Since Date"),  components.hour!)
        } else if (components.hour! >= 1){
            return String.localizedStringWithFormat("timeAgoSinceDate_hourAgo %d".localized(comment: "Time Ago Since Date"),  components.hour!)
        } else if (components.minute! >= 2) {
            return String.localizedStringWithFormat("timeAgoSinceDate_minutesAgo %d".localized(comment: "Time Ago Since Date"),  components.minute!)
        } else if (components.minute! >= 1){
            return String.localizedStringWithFormat("timeAgoSinceDate_minuteAgo %d".localized(comment: "Time Ago Since Date"),  components.minute!)
        } else if (components.second! >= 3) {
            return String.localizedStringWithFormat("timeAgoSinceDate_secondsAgo %d".localized(comment: "Time Ago Since Date"),  components.second!)
        } else {
            return String.localizedStringWithFormat("timeAgoSinceDate_justNow".localized(comment: "Time Ago Since Date"),  components.second!)
        }
    }
    
    func daysFromDate(date: Date) -> Int?{
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return components.day
    }
    
    func minutesFromDate(date: Date) -> Int?{
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)
        
        let components = calendar.dateComponents([.minute], from: date1, to: date2)
        return components.minute
    }
    
    func getCompleteDate() -> (second: Int, minute: Int, hour: Int, day: Int, month: Int, year: Int){
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        let second = calendar.component(.second, from: self)
        let year = calendar.component(.year, from: self)
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        
        return(second, minute, hour, day, month, year)
    }
    
    func isTheSameDay(of date: Date) -> Bool{
        return Calendar.current.isDate(self, inSameDayAs: date)
    }
    
    func hoursAndMinutes() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}
