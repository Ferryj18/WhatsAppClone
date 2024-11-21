//
//  Extension.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 21/11/24.
//

import Foundation
import UIKit

extension Date {
    func longDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: self)
    }
    
   }
