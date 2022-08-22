//
//  RouteData+CoreDataProperties.swift
//  XBikeApp
//
//  Created by leonard Borrego on 22/08/22.
//
//

import Foundation
import CoreData


extension Route {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Route> {
        return NSFetchRequest<Route>(entityName: "RouteData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var points: String?
    @NSManaged public var duration: String?

}

