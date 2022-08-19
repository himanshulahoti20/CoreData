//
//  UserInformation+CoreDataProperties.swift
//  
//
//  Created by Himanshu Lahoti on 26/06/22.
//
//

import Foundation
import CoreData


extension UserInformation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInformation> {
        return NSFetchRequest<UserInformation>(entityName: "UserInformation")
    }

    @NSManaged public var dob: String?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var image: Data?

}
