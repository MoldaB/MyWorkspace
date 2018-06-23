import Foundation
import CoreData
//import RxSwift

final class ContextScheduler
{
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func schedule<StateType>(_ state: StateType, action: @escaping (StateType) -> ()) -> () -> () {
        
        return {
            self.context.perform {
                action(state)
            }
        }
    }
}
