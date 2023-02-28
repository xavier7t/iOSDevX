//
//  Persistence-DemoCoreData20230210.swift
//  iOSDevX
//
//  Created by Xavier on 2/27/23.
//

import Foundation
import CoreData

class PersistenceController {
    // static instance for reusability
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    // init the class and init the container
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Model20230210")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error {
                print("Could not load Core Data persistence stores.", error.localizedDescription)
                fatalError()
            }
        }
    }
    
    // reusable function to save changes to DB
    func saveChanges() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Could not save changes to Core Data.", error.localizedDescription)
            }
        }
    }
    
    // function to create a note
    func create(title: String, body: String, isFavorite: Bool) {
        // create a NSManagedObject, will be saved to DB later
        let entity = Note(context: container.viewContext)
        // attach value to the entity’s attributes
        entity.id = UUID()
        entity.title = title
        entity.body = body
        entity.isFavorite = isFavorite
        entity.createdAt = Date()
        // save changes to DB
        saveChanges()
    }
    
    // function to fetch notes from DB
    func read(predicateFormat: String? = nil, fetchLimit: Int? = nil) -> [Note] {
        // create a temp array to save fetched notes
        var results: [Note] = []
        // initialize the fetch request
        let request = NSFetchRequest<Note>(entityName: "Note")
        
        // define filter and/or limit if needed
        if predicateFormat != nil {
            request.predicate = NSPredicate(format: predicateFormat!)
        }
        if fetchLimit != nil {
            request.fetchLimit = fetchLimit!
        }
        
        // fetch with the request
        do {
            results = try container.viewContext.fetch(request)
        } catch {
            print("Could not fetch notes from Core Data.")
        }
        
        // return results
        return results
    }
    
    // function to update an existing note
    func update(entity: Note, title: String? = nil, body: String? = nil, isFavorite: Bool? = nil) {
        // create a temp var to tell if an attribute is changed
        var hasChanges: Bool = false
        
        // update the attributes if a value is passed into the function
        if title != nil {
            entity.title = title!
            hasChanges = true
        }
        if body != nil {
            entity.body = body!
            hasChanges = true
        }
        if isFavorite != nil {
            entity.isFavorite = isFavorite!
            hasChanges = true
        }
        
        // save changes if any
        if hasChanges {
            saveChanges()
        }
    }
    
    // function to delete a note
    func delete(_ entity: Note) {
        container.viewContext.delete(entity)
        saveChanges()
    }
}
