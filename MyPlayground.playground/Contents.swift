import Cocoa

public struct ApplicationsFolder
{
    enum ApplicationsFolderError: Error
    {
        case invalidPath(providedPath)
    }
    
    let path: String
    var applications: [String]
    
    init(path: String) {
        self.path = path
    }
    
    mutating func loadApplications(_ path: String? = nil) throws -> [String] {
        var directoriesContents : (String) -> [String]? = {
            directoryPath -> throws [String]? in
                let contents = try FileManager.default.contentsOfDirectory(atPath: directoryPath)
                return contents
        }
        
        // If Path Provided Use It
        // Else Path Wasnt Provided Lookup for applications folder
        if let path = path,
            let applicationsPathContent = directoriesContents(path) {
            return applicationsPathContent ?? []
        } else {
            if FileManager.default.fileExists(atPath: applicationsFolder) {
                return directoriesContents(applicationsFolder) ?? []
            } else if FileManager.default.fileExists(atPath: "/Applications") {
                return directoriesContents("/Applications") ?? []
            }
            return []
        }
        
        
    }
    
    func loadIcon(for application: String) {
        
    }
    
    func loadName(for application: String) {
        
    }
}

let applicationsPaths = NSSearchPathForDirectoriesInDomains(
    .applicationDirectory,
    .allDomainsMask,
    true
)
applicationsPaths.first

let applicationsFolder = applicationsPaths.first ?? ""

var applicationsDirectoryContents : () -> [String] = {
    if FileManager.default.fileExists(atPath: applicationsFolder) {
        return directoriesContents(applicationsFolder) ?? []
    } else if FileManager.default.fileExists(atPath: "/Applications") {
        return directoriesContents("/Applications") ?? []
    }
    return []
}

let contents = applicationsDirectoryContents()
let applications : [String] = contents.compactMap {
    let parts = $0.split(separator: ".")
    if parts.count > 1,
        String(parts[1]) == "app" {
        return String(parts[0])
    }
    return nil
}

func name(for applicationName: String) {
    
}

func icon(for applicationName: String) {
    
}
func nameAndIcon(for applicationName: String) -> (String?, Any?)? {
    // get absolute apps path
    let absolutePath = "/Applications/\(applicationName).app"
    // get app bundle
    if let appBundle = Bundle.init(path: absolutePath) {
        // Fetches Bundle Name
        let bundleName = appBundle.infoDictionary?["CFBundleName"] as? String
        // Fetches Bundle Icon Files
        let bundleImage = NSWorkspace.shared.icon(forFile: absolutePath)
        // Returns All
        return (bundleName,bundleImage)
    }
    return nil
}

let singleApplicationNameAndIcon = nameAndIcon(for: applications.first!)

let applicationNamesAndIcons = applications.compactMap {
    nameAndIcon(for: $0)
}

let firstApplication = applicationNamesAndIcons.first!
firstApplication.1
