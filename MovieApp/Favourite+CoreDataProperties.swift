//
//  Favourite+CoreDataProperties.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//
//

import Foundation
import CoreData


extension Favourite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favourite> {
        return NSFetchRequest<Favourite>(entityName: "Favourite")
    }

    @NSManaged public var movieTitle: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var movieId: String?
    @NSManaged public var isFav: Bool
    @NSManaged public var synopsis: String?
    @NSManaged public var image: String?

}

extension Favourite : Identifiable {

}
