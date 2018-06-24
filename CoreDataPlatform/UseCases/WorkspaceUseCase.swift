import Foundation
import Domain
import RxSwift

final class WorkspaceUseCase<Repository>: Domain.WorkspaceUseCase where Repository: AbstractRepository, Repository.T == Workspace
{    
    private let repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }

    
    func getWorkspaceList() -> Observable<[Workspace]> {
        return repository.query(
            with: nil,
            sortDescriptors: [Workspace.CoreDataType.lastUseDate.descending()]
        )
    }
    
    func createWorkspace(with name: String, applications: [String]) -> Observable<Workspace> {
        let newWorkspace = Workspace(name: name,
                                     lastUseDate: Date(),
                                     applications: applications)
        return repository.save(entity: newWorkspace).map { newWorkspace }
    }
    
    func replace(workspace: Workspace, for newWorkspace: Workspace) -> Observable<Void> {
        let deletion = repository.delete(entity: workspace)
        let addition = repository.save(entity: newWorkspace)
        return Observable.zip(deletion,addition).mapToVoid()
    }
    
    func delete(workspace: Workspace) -> Observable<Void>  {
        return repository.delete(entity: workspace)
    }
}
