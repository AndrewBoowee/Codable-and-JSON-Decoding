//
//  ViewController.swift
//  Codable and JSON Decoding
//
//  Created by Drew Boowee on 7/19/19.
//  Copyright © 2019 Drew Boowee. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    //tested out example code but could not get it to work
//    class PhotoSetLoader {
 //           let jsonDecoder = JSONDecoder()
 //           jsonDecoder.dateDecodingStrategy = .iso8601
//            if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
//                let jsonData = try? Data(contentsOf: jsonFileUrl) {
//                photoSet = try? jsonDecoder.decode(PhotoSet.self, from: jsonData)
 //           }
//            return photoSet
//        }
//    }
    
     let jsonFileName = "photos"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    if; let ViewController = ViewControllerLoader.load(jsonFileName: jsonFileName) {
        var displayInfo = ""
        displayInfo += "Status: \(ViewController.status)\n"
        displayInfo += "Photos path: \(ViewController.photosPath)\n\n"
        for photo in photoCollection.photos {
            displayInfo += "Photo:\n"
            displayInfo += "\(photo.title)\n"
            displayInfo += "\(photo.description)\n"
            displayInfo += "\(photo.date)\n"
            displayInfo += "\(photo.latitude)\n"
            displayInfo += "\(photo.longitude)\n"
            displayInfo += "\(photo.image)\n\n"
        }
        displayTextView.text = displayInfo
    }
    else
    {
    displayTextView.text = "Error."
    }
}
    



