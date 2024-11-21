//
//  Util.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 19/11/24.
//

import Foundation


func fileNameFrom(_ url: String) -> String {
    let fileName = ((url.components(separatedBy: "_").last)?.components(separatedBy: "?").first)?.components(separatedBy: ".").first
    return fileName ?? ""
}
///"https://firebasestorage.googleapis.com:443/v0/b/whatsappclone-4ef62.firebasestorage.app/o/Avatars%2F_yMfJq36yUVMhRhBihfwMM3nUSPZ2.jpg?alt=media&token=bb6cdbf0-32ae-4594-aa8e-bd16b4b54b92"
//yMfJq36yUVMhRhBihfwMM3nUSPZ2

func fileExistsAtPath(_ fileName: String) -> Bool {
    return FileManager.default.fileExists(atPath: fileDocumentsDirectory(fileName: fileName))
}

func fileDocumentsDirectory(fileName: String) -> String {
  return getDocumentsUrl().appendingPathComponent(fileName).path
}
func getDocumentsUrl() -> URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
}
// Mark- File Date
func timeElapsed(date: Date) -> String {
  let seconds = Date().timeIntervalSince(date)
  
  var elapsed = ""
  
  if seconds < 60 {
    print("ada elapsed")
    elapsed = "Just now"
  } else if seconds < 60 * 60 {
    print("ada elapsed")
    let minutes = Int(seconds/60)
    let minText = minutes > 1 ? "mins" : "min"
    elapsed = "\(minutes) \(minText)"
  } else if seconds < 24 * 60 * 60 {
    print("ada elapsed")
    let hours = Int(seconds / (60*60))
    let hourText = hours > 1 ? "hours" : "hour"
    elapsed = "\(hours) \(hourText)"
  } else {
    print("ada elapsed")
    elapsed = date.longDate()
  }
  return elapsed
}
