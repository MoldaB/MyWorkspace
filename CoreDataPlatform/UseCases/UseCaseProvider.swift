import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider
{
    private let coreDataStack = CoreDataStack()
    private let workspaceRepository: Repository<Workspace>

    public init() {
        workspaceRepository = Repository<Workspace>(context: coreDataStack.context)
    }

    public func provideWorkspaceUseCase() -> Domain.WorkspaceUseCase {
        return WorkspaceUseCase(repository: workspaceRepository)
    }
}
