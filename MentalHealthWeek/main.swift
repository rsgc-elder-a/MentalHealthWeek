//
//  main.swift
//  MentalHealthWeek
//
//  Created by Russell Gordon on 1/12/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Foundation


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

// Iterate over each line in the file and print to the terminal
func seperate (rawString : String) -> [String] {
    var lineArray = [String]()
    
    return lineArray
    
}



for line in reader {
    //print(">" + line.trimmingCharacters(in: .whitespacesAndNewlines))
    var currentLine = line.trimmingCharacters(in: .whitespacesAndNewlines)
    
    
    
    print(">", terminator: "")
    print(currentLine)
    
    
    
}

