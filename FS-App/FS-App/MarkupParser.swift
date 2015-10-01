//
//  MarkupParser.swift
//  FS-App
//
//  Created by Benjamin Reischboeck on 30.09.15.
//  Copyright © 2015 Fachschaft07. All rights reserved.
//

import UIKit

struct Fonts {
    static let header: UIFont = UIFont(name: "HelveticaNeue-Bold", size: 28.0)!
    static let headerItalic: UIFont = UIFont(name: "Helvetica-BoldOblique", size: 28.0)!
    static let normalText: UIFont = UIFont(name: "HelveticaNeue", size: 12.0)!
    static let boldText: UIFont = UIFont(name: "HelveticaNeue-Bold", size: 12.0)!
    static let italicText: UIFont = UIFont(name: "HelveticaNeue-Italic", size: 12.0)!
    static let boldItalicText: UIFont = UIFont(name: "Helvetica-BoldOblique", size: 12.0)!
}

class MarkupParser {
    
    func parseString(source: String) -> NSAttributedString {
        let bulletPoint: String = "•"
        let completeString = NSMutableAttributedString()
        let input = source.stringByReplacingOccurrencesOfString("#", withString: "\n")
        let lines = input.componentsSeparatedByString("\n")
        for line in lines {
            if line.hasPrefix("*"){
                let current = line.stringByReplacingOccurrencesOfString("*", withString: "")
                completeString.appendAttributedString(NSAttributedString(string: "\(current)\n", attributes: [NSFontAttributeName : Fonts.boldText]))
            } else if line.hasPrefix("~"){
                let current = line.stringByReplacingOccurrencesOfString("~", withString: "")
                completeString.appendAttributedString(NSAttributedString(string: "\(current)\n", attributes: [NSFontAttributeName : Fonts.italicText]))
            }

            else if line.hasPrefix("."){
                var current = line.stringByReplacingCharactersInRange(line.startIndex...line.startIndex, withString: bulletPoint)
                current = current.stringByReplacingOccurrencesOfString(" .", withString: "")
                completeString.appendAttributedString(NSAttributedString(string: "\(current)\n", attributes: [NSFontAttributeName : Fonts.normalText]))
            }
            else {
                completeString.appendAttributedString(NSAttributedString(string: "\(line)\n", attributes: [NSFontAttributeName : Fonts.normalText]))
            }
        }
        
        return completeString
    }
}

//hashtag neue zeile,
//*text* fett
//.Text = liste
// . = listenEnde