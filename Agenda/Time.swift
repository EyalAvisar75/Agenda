//
//  Time.swift
//  Agenda
//
//  Created by eyal avisar on 03/08/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import Foundation


public struct TimeUnit {
    static var unit = 7
}

class MyAlert:Codable {
    var startTime:Date?
    var endTime:Date?
    var eventName:String?
    var location:String?
    var repeating:String?
    var endRepeat:Date?
    var travelTime:Int?
    var alert:Int?
    
    init() {}
    
    func printAlert() {
        print("start \(startTime) end \(endTime)")
    }
}

var alert:MyAlert?
let now = Date()
let components = Calendar.current.dateComponents([.month, .day, .year, .weekday], from: now)

let month = components.month!
let monthStr = Calendar.current.monthSymbols[month - 1]
let monthDay = components.day!
let year = components.year!
let weekDay = components.weekday!
var currentWeekDay = weekDay
let day = components.day!
var currentMonth = month
var currentYear = year

func getFirstDayOfMonth(requiredMonth:Int, requiredYear:Int) -> Int {
    let calendar = Calendar.current
    
    var dateComponents: DateComponents? = calendar.dateComponents([.hour, .minute, .second], from: Date())

    dateComponents?.day = 1
    dateComponents?.month = requiredMonth
    dateComponents?.year = requiredYear
    
    let date: Date? = calendar.date(from: dateComponents!)
    
    dateComponents = Calendar.current.dateComponents([.weekday], from: date!)

    return dateComponents!.weekday! % 7
}

let firstDayOfMonth = getFirstDayOfMonth(requiredMonth: month, requiredYear: year)
var currentFirstDay = firstDayOfMonth

func getLastDayOfMonth(requiredMonth:Int, requiredYear:Int) -> Int {
    let calendar = Calendar.current
    
    var dateComponents: DateComponents? = calendar.dateComponents([.hour, .minute, .second], from: Date())

    dateComponents?.day = 1
    dateComponents?.month = requiredMonth
    dateComponents?.year = requiredYear
    
    let date: Date? = calendar.date(from: dateComponents!)

    let range = calendar.range(of: .day, in: .month, for: date!)!
    let numDays = range.count

    return numDays
}

let lastDayOfMonth = getLastDayOfMonth(requiredMonth: month, requiredYear: year)
var currentLastDay = lastDayOfMonth
