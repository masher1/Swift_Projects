import UIKit

var str = "Hello, playground"


struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}


let newNote = Note(title: "Grocery run", text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles.", timestamp: Date())

let note1 = Note(title: "ToDo List", text: "Do laundry, Go Grocery Shopping, Do homework", timestamp: Date())
let note2 = Note(title: "Hobbies", text: "Photography, Videography, Coding", timestamp: Date())
let note3 = Note(title: "Note Three", text: "This is yet another sample note.", timestamp: Date())
let notes = [newNote, note1, note2, note3]

/*let propertyListEncoder = PropertyListEncoder()
if let encodedNote = try? propertyListEncoder.encode(newNote){
    print(encodedNote)
    let propertyListDecoder = PropertyListDecoder()
    if let decodedNote = try? propertyListDecoder.decode(Note.self, from: encodedNote){
        print(decodedNote)
    }
}
*/
 
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(notes)

try? encodedNote?.write(to: archiveURL, options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()
if let retrievedNotesData = try? Data(contentsOf: archiveURL), let decodedNotes = try? propertyListDecoder.decode(Array<Note>.self, from: retrievedNotesData){
    print(decodedNotes)
}
