import Foundation
import Domain

final class WorkspaceUseCase<Repository>: Domain.WorkspaceUseCase where Repository: AbstractRepository, Repository.T == Workspace
{    
    private let repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }

    
    func getWorkspaceList(_ completionHandler: ([Workspace]) -> Void) {
        repository.query(with: nil,
                         sortDescriptors: [], //Workspace.CoreDataType.usedAt.descending()
            completionHandler: completionHandler)
    }
    
    func createWorkspace(with name: String, applications: [String], completionHandler: @escaping (Workspace) -> Void) {
        let newWorkspace = Workspace(name: name,
                                     creationDate: Date(),
                                     applications: applications)
        repository.save(entity: newWorkspace) { [newWorkspace, completionHandler] in
            completionHandler(newWorkspace)
        }
    }
    
    func replace(workspace: Workspace, for newWorkspace: Workspace, completionHandler: @escaping (Bool, Error?) -> Void) {
        repository.delete(entity: workspace) { [repository, newWorkspace, completionHandler] in
            repository.save(entity: newWorkspace) { [completionHandler] in
                completionHandler(true,nil)
            }
        }
    }
    
    func delete(workspace: Workspace, completionHandler: @escaping (Bool, Error?) -> Void) {
        repository.delete(entity: workspace) { [completionHandler] in
            completionHandler(true,nil)
        }
    }
}
