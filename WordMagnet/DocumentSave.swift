//
//  DocumentSave.swift
//  WordMagnet
//
//  Created by Jason  on 3/11/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

import UIKit
import Foundation

func DocumentsDirectory() -> String{
    return NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first as String
}

func FilePathInDocumentsDirectory(fileName: String) -> String{
    return DocumentsDirectory().stringByAppendingPathComponent(fileName)
}

func saveLabelPositions(vc:UIViewController)
{
    labelPositionsArray.removeAllObjects()
    
    for view in vc.view.subviews
    {
        if(view.isKindOfClass(UILabel))
        {
            var l = UILabel()
            l = view as UILabel
            var word = l.text
            var pos = NSStringFromCGPoint(view.center)
            var label = ["text":word, "position": pos]
            labelPositionsArray.addObject(label)
        }
    }
    
    labelPositionsArray.writeToFile(FilePathInDocumentsDirectory("labelPositions.plist"), atomically: true)
    //println(DocumentsDirectory())
}



