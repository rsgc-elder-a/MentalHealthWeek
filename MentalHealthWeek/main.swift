//
//  main.swift
//  MentalHealthWeek
//
//  Created by Russell Gordon on 1/12/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Foundation


struct Supervisor {
    var activity : Activity
    var name : String
    
    init(activity: Activity, name: String)
    {
        self.activity = activity
        self.name = activity.name
    }
}

struct Activity {
    var studentNames : [String]
    var name : String
    var personCap : Int
    var supervisorName : String
    
    init(studentNames: [String], name: String, personCap: Int, supervisorName : String)
    {
        self.studentNames = studentNames
        self.name = name
        self.personCap = personCap
        self.supervisorName = supervisorName
    }
}

struct Student {
    var email: String
    var timestamp: String
    var activities: [String]
    
    init(email: String, timestamp: String, activities: [String])
    {
        self.email = email
        self.timestamp = timestamp
        self.activities = activities
    }
}

struct Advisor {
    var students : [Student]
    
    init(students: [Student])
    {
        self.students = students
    }
}

var activities : [Activity] = [
    Activity(studentNames: [""], name: "Sleep In", personCap: 500, supervisorName: "Mr. Fitz"),
    Activity(studentNames: [""], name: "Casual Breakfast", personCap: 160, supervisorName: "Ms. Totten"),
    Activity(studentNames: [""], name: "Physical Activity", personCap: 50, supervisorName: "Mr. T/ Mr. S"),
    Activity(studentNames: [""], name: "Relaxation", personCap: 160, supervisorName: "Fr. Donkin"),
    Activity(studentNames: [""], name: "Academic Management", personCap: 30, supervisorName: "Fr. D and NVH(Monday) KU (Wed-Fri) TH"),
    Activity(studentNames: [""], name: "Yoga", personCap: 20, supervisorName: "Ms. McPhedran"),
    Activity(studentNames: [""], name: "Animal Therapy", personCap: 16, supervisorName: "Ms. Kaye/Fitz"),
    Activity(studentNames: [""], name: "Massage", personCap: 12, supervisorName: "Ms."),
]



// Open an output file for writing, overwriting any existing data
guard let writer = LineWriter(path: "/Users/student/Documents/MentalHealthWeek/survey_output.txt", appending: false) else {
    print("Cannot open output file")
    exit(0); // cannot open output file
}


// Iterate over the array of column headers and print each element to the output file
//for (column, descriptor) in columnDescriptors.enumerated() {






// Read the text file (place in your home folder)
// Path will probably be /Users/student/survey_response_sample.txt
// Obtain the data file on Haiku, Day 37
guard let reader = LineReader(path: "/Users/student/Documents/MentalHealthWeek/survey_response_all_data_new_headers.csv") else {
    exit(0); // cannot open file
}


// Structures used to process data
var columnDescriptors : [String] = []
var firstLine = [String]()

var macCaps = [160, 50, 160, 30, 20, 16, 12]


func activity (whole: String) -> String  {
    var switchNow = 0
    var charSetup = [Character]()
    var output = ""
    for char in whole.characters {
        
        
        if switchNow == 2 {
            charSetup.append(char)
            
        }
        
        if char == "_" {
            switchNow += 1
        }
        
    }
    output = String(charSetup)
    return output
}



func grade9(line : [String])  {
    var count = 0
    var allAct = [String]()
    for value in line {
        
        if (value == "1"){
            //print(firstLine[count])
            allAct.append(activity(whole: firstLine[count]))
            // print("Pizza")
        }
        
        count += 1
    }
    //(line: "\(format(baseWord: allAct[0]))\(format(baseWord: allAct[1]))\(format(baseWord: allAct[2])\(format(baseWord: allAct[3]))\(format(baseWord: allAct[4]))")
    
  //  writer.write(line: "|\(format(baseWord: allAct[0]))\(format(baseWord: allAct[1]))\(format(baseWord: allAct[2]))\(format(baseWord: allAct[3]))\(format(baseWord: allAct[4]))|")
    
        writer.write(line: "\(format(baseWord: allAct[0]))\(format(baseWord: allAct[1]))\(format(baseWord: allAct[2]))\(format(baseWord: allAct[3]))\(format(baseWord: allAct[4]))")
    
    //writer.write(line: "|____________________________________________________________________________________________________|")
    for _ in 1...3{
        writer.write(line: "")
    }
}

func grade10(line : [String]) {
    
    
}

func grade11(line : [String]) {
    
}

func grade12(line : [String]) {
    
}


func format (baseWord: String) -> String {
    
    let standardAmount = 16
    var needChar = 0
    var charAmount = 0
    var newChar = [Character]()
    
    for char in baseWord.characters {
        newChar.append(char)
        charAmount += 1
    }
    if (standardAmount > charAmount) {
        needChar = standardAmount - charAmount
    }
    for i in 0...needChar {
        newChar.append(" ")
    }
    var newString = String(newChar)
    return newString
}


func finishLine (start: String) -> String {
    var finalString = start
    var lineLegnth = 94
    var count2 = 0
    var sub = 0
    
    for char in start.characters {
        count2 += 1
    }
    if count2 < 94{
        sub = (lineLegnth) - (count2) // 95 is the amount of char in a line
        
        for _ in 0...sub {
            finalString += " "
        }
    }
    finalString += "      |"
    
    return finalString
}






var first = false
// Iterate over each line in the file and print to the terminal
for (number, line) in reader.enumerated() {
    
    
    // Look for first line and build an array of column descriptors
    //if number == 0 {
    
    // Get an array of all the information on the first line
    // "Explode" the string into an array of smaller strings using a comma as a delimiter
    columnDescriptors = line.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).components(separatedBy: ",")
    
    var currentLine = [String]()
    
    
    // Iterate over the array to get values
    for (column, value) in columnDescriptors.enumerated() {
        
        
        currentLine.append(value)
        
        if (first == false){
            firstLine.append(value)
        }
        
        
    }
    first = true
    
    
    //print(firstLine)
    var id = currentLine[5]
    var advisor = currentLine[10]
    var grade1 = currentLine[9]
    var week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    var secondLine = finishLine(start: "\(format(baseWord: id)) -> \(format(baseWord: advisor))\(format(baseWord: grade1))")
    print(secondLine)
    /*
    writer.write(line: "_____________________________________________________________________________________________________")
    writer.write(line: "\(finishLine(start: secondLine))")
    writer.write(line: "|                                                                                                    |" )
    writer.write(line: "|\(format(baseWord: week[0]))\(format(baseWord: week[1]))\(format(baseWord: week[2]))\(format(baseWord: week[3]))\(format(baseWord: week[4]))|")
    writer.write(line: "|                                                                                                    |" )
    */

    writer.write(line: "\(format(baseWord: id)) -> \(format(baseWord: advisor))\(format(baseWord: grade1))")
    writer.write(line: "" )
    writer.write(line: "\(format(baseWord: week[0]))\(format(baseWord: week[1]))\(format(baseWord: week[2]))\(format(baseWord: week[3]))\(format(baseWord: week[4]))")
    writer.write(line: "" )
    
    
    var grade = currentLine[9]
    switch(grade){
    case "9":
        grade9(line: currentLine)
    case "10":
        grade10(line: currentLine)
    case "11":
        grade11(line: currentLine)
    default:
        grade12(line: currentLine)
    }
    
    
    //print(currentLine)
    //print("Identifier: \(currentLine[5]) Grade: \(currentLine[6]) Advisor: \(currentLine[7])")
    
}
//print(firstLine)

// Close the output file
writer.close() // MAKE NOTE OF THIS

