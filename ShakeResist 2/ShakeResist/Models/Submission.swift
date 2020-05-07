//
//  Content.swift
//  ShakeResist
//
//  Created by Malkiel Asher on 5/5/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//
/*
File Description: This file is the main Model for the rest of the models it includes the title, content, time, and submission type. We will make sure that everything saves to the phone's local storage by utilizing the saveToFile and LoadFromFile functions
*/

import Foundation

class Submission: Codable {
    let title: String
    let content: String
//    let time: Time
//    let submissionType : SubmissionType
    
    init(title: String, content: String/*, time: Time, submissionType: SubmissionType*/) {
        self.title = title
        self.content = content
//        self.time = time
//        self.submissionType = submissionType
    }
    
    static var archiveURL: URL {
        get{
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("submissions").appendingPathExtension("plist")
        }
    }
    
    static func saveToFile(submissions: [Submission]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedSubmissions = try? propertyListEncoder.encode(submissions)
        
        try? encodedSubmissions?.write(to: Submission.archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Submission] {
        let propertyListDecoder = PropertyListDecoder()
        
        if let retrievedSubmissionData = try? Data(contentsOf: Submission.archiveURL), let decodeSubmissions = try? propertyListDecoder.decode([Submission].self, from: retrievedSubmissionData){
            return decodeSubmissions
        }
        
        return []
    }
    
    static func loadSampleSubmissions() -> [Submission]{
        let submissions: [Submission] = [
            Submission(title: "Reddit Post", content: "The greatest tragedy of Charlie and the Chocolate factory isn't the mishaps involving children, but how a master of theoretical physics chose to make candy for a living."),
            Submission(title: "Writing Prompt", content: "The year is 1910. Adolf Hitler, a struggling artist, has fought off dozens of assasination attemps by well meaning time travelers, but this one is different. This traveller doesn't want to kill Hitler, he wants to teach him to paint. He pulls off his hood to reveal the frizzy afro of Bob Ross.")]
        
    return  submissions
    }
}
