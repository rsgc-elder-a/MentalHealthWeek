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




/// Read text file line by line
class LineReader {
    let path: String
    
    fileprivate let file: UnsafeMutablePointer<FILE>!
    
    init?(path: String) {
        self.path = path
        
        file = fopen(path, "r")
        
        guard file != nil else { return nil }
        
    }
    
    var nextLine: String? {
        var line:UnsafeMutablePointer<CChar>? = nil
        var linecap:Int = 0
        defer { free(line) }
        return getline(&line, &linecap, file) > 0 ? String(cString: line!) : nil
    }
    
    deinit {
        fclose(file)
    }
}

extension LineReader: Sequence {
    func  makeIterator() -> AnyIterator<String> {
        return AnyIterator<String> {
            return self.nextLine
        }
    }
}

// Read the text file (place in your home folder)
// Path will probably be /Users/student/survey_response_sample.txt
// Obtain the data file on Haiku, Day 37
guard let reader = LineReader(path: "/Users/student/Documents/MentalHealthWeek/survey_response_sample.txt") else {
    exit(0); // cannot open file
    
}




for line in reader {
    //print(">" + line.trimmingCharacters(in: .whitespacesAndNewlines))
    var currentLine = line.trimmingCharacters(in: .whitespacesAndNewlines)
    
    var input = line.trimmingCharacters(in: .whitespacesAndNewlines)
    var parsedInput = input.characters.split{$0 == "\t"}.map(String.init)
    
    
    if (parsedInput.count > 0 && parsedInput.count < 100){ //these are all the poeple who fully completed the survey
        

            print(parsedInput)
            
            
        
    }
    
    //print(">", terminator: "")
    //print(currentLine)
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

// Close the output file
writer.close()




