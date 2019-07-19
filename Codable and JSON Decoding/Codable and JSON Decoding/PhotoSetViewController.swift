//
//  PhotosetViewController.swift
//  Codable and JSON Decoding
//
//  Created by Drew Boowee on 7/19/19.
//  Copyright © 2019 Drew Boowee. All rights reserved.
//

import Foundation
import UIKit

class PhotoSetViewController: UIViewController {
    @IBOutlet weak var displayTextView: UITextView!
    
class PhotoSetLoader {
        
        class func load(jsonFileName: String) -> PhotoSet? {
            var photoSet: PhotoSet?
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            
            if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
                let jsonData = try? Data(contentsOf: jsonFileUrl) {
                photoSet = try? jsonDecoder.decode(PhotoSet.self, from: jsonData)
            }
            
            return photoSet
        }
}
    
    let jsonFileName = "photos"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photoSet = PhotoSetLoader.load(jsonFileName: jsonFileName) {
            var displayInfo = ""
            displayInfo += "Status: \(photoSet.status)\n"
            displayInfo += "Photos path: \(photoSet.photosPath)\n\n"
            for photo in photoSet.photos {
                displayInfo += "Photo:\n"
                displayInfo += "\(photo.title)\n"
                displayInfo += "\(photo.description)\n"
                displayInfo += "\(photo.date)\n"
                displayInfo += "\(photo.latitude)\n"
                displayInfo += "\(photo.longitude)\n"
                displayInfo += "\(photo.imageName)\n\n"
            }
            displayTextView.text = displayInfo
        } else {
            displayTextView.text = "Error."
        }
    }
    
    struct PhotoSet: Codable {
        var status: String
        var photosPath: String
        var photos: [PhotoItem]
        
        enum CodingKeys: String, CodingKey {
            case status
            case photosPath = "photos_path"
            case photos
        }
    }
    
    struct PhotoItem: Codable {
        var imageName: String
        var title: String
        var description: String
        var latitude: Double
        var longitude: Double
        var date: Date
        
        enum CodingKeys: String, CodingKey {
            case imageName = "image"
            case title
            case description
            case latitude
            case longitude
            case date
        }
    }
}
