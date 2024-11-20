//
//  PhotoProject+CoreDataProperties.swift
//
//
//  Created by Роман on 20.11.2024.
//
//

import Foundation
import CoreData
import UIKit

@objc(PhotoProject)
public class PhotoProject: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoProject> {
        return NSFetchRequest<PhotoProject>(entityName: "PhotoProject")
    }

    @NSManaged public var photo: UIImage?
    @NSManaged public var project: Project?

}

extension PhotoProject : Identifiable {

}
