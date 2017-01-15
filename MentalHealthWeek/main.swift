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


// Open an output file for writing, overwriting any existing data
guard let writer = LineWriter(path: "/Users/student/Documents/MentalHealthWeek/survey_output.txt", appending: false) else {
    print("Cannot open output file")
    exit(0); // cannot open output file
}


// Iterate over the array of column headers and print each element to the output file
//for (column, descriptor) in columnDescriptors.enumerated() {


writer.write(line: "Young Jeff          Ghoeshy             Grade 12                          ")
writer.write(line: "")
writer.write(line: "Monday              Tuesday             Wednesday           Thursday        Friday          ")
writer.write(line: "")
writer.write(line: "Animal Therepy      Animal Therepy      Animal Therepy      Animal Therepy  Animal Therepy")
writer.write(line: "")

//writer.write(line: "                                 Ghoeshy                                  ")

//}





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
    var switchNow = false
    var recordNow = false
    for char in whole.characters {
    
        if char == "_" {
            if switchNow == true {
                recordNow = true
            }
            switchNow = true
        }
    }
    
}

func grade9(line : [String])  {
var count = 0
    for value in line {
        
            if (value == "1"){
            print(firstLine[count])
           // print("Pizza")
        }
        count += 1
    }
}

func grade10(line : [String]) {
    
}

func grade11(line : [String]) {
    
}

func grade12(line : [String]) {

}


// Close the output file
writer.close() // MAKE NOTE OF THIS

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
    
    //print(firstLine)
    //print(currentLine)
    //print("Identifier: \(currentLine[5]) Grade: \(currentLine[6]) Advisor: \(currentLine[7])")
    
}
//print(firstLine)
