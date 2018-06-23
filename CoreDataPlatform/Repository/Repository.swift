import Foundation
import CoreData
//import RxSwift
import QueryKit

protocol AbstractRepository
{
    associatedtype T
    func query(with predicate: NSPredicate?,
               sortDescriptors: [NSSortDescriptor]?,
               completionHandler: ([T]) -> ())
    func save(entity: T, completionHandler: () -> ())
    func delete(entity: T, completionHandler: () -> ())
}

final class Repository<T: CoreDataRepresentable>: AbstractRepository where T == T.CoreDataType.DomainType
{
    
    private let context: NSManagedObjectContext
//    private let scheduler: ContextScheduler

    init(context: NSManagedObjectContext) {
        self.context = context
//        self.scheduler = ContextScheduler(context: context)
    }
    
    func query(with predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, completionHandler: ([T]) -> ()) {
        let request = T.CoreDataType.fetchRequest()
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        return context.rx.entities(fetchRequest: request)
            .mapToDomain()
            .subscribeOn(scheduler)
    }
    
    func save(entity: T, completionHandler: () -> ()) {
        return entity.sync(in: context)
            .mapToVoid()
            .flatMapLatest(context.rx.save)
            .subscribeOn(scheduler)
    }
    
    func delete(entity: T, completionHandler: () -> ()) {
        return entity.sync(in: context)
            .map({$0 as! NSManagedObject})
            .flatMapLatest(context.rx.delete)
    }
}
