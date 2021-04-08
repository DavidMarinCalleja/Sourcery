import Foundation
import PathKit
import XcodeProj

extension XcodeProj {

//    func target(named targetName: String) -> PBXTarget? {
//        return pbxproj.objects.targets(named: targetName).first?.object
//    }

    func target(named targetName: String) -> PBXTarget? {
        pbxproj.targets(named: targetName).first
    }

//    func fullPath<E: PBXFileElement>(fileElement: ObjectReference<E>, sourceRoot: Path) -> Path? {
//        return pbxproj.objects.fullPath(fileElement: fileElement.object, reference: fileElement.reference, sourceRoot: sourceRoot)
//    }

    func fullPath<E: PBXFileElement>(fileElement: E, sourceRoot: Path) -> Path? {
        do {
            return try fileElement.fullPath(sourceRoot: sourceRoot)
        } catch {
            return nil
        }
    }

//    func sourceFilesPaths(target: PBXTarget, sourceRoot: Path) -> [Path] {
//        return pbxproj.objects.sourceFiles(target: target)
//            .compactMap({ fullPath(fileElement: $0, sourceRoot: sourceRoot) })
//    }

    func sourceFilesPaths(target: PBXTarget, sourceRoot: Path) -> [Path] {
        do {
            return try target.sourceFiles()
                .compactMap { fullPath(fileElement: $0, sourceRoot: sourceRoot) }
        } catch {
            return []
        }
    }

//    var rootGroup: PBXGroup {
//        return pbxproj.rootGroup
//    }

    var rootGroup: PBXGroup? {
        do {
            return try pbxproj.rootGroup()
        } catch {
            return nil
        }
    }

//    func addGroup(named groupName: String, to toGroup: PBXGroup, options: GroupAddingOptions = []) -> ObjectReference<PBXGroup> {
//        // swiftlint:disable:next force_unwrapping
//        return pbxproj.objects.addGroup(named: groupName, to: toGroup, options: options).last!
//    }

    func addGroup(named groupName: String, to toGroup: PBXGroup?, options: GroupAddingOptions = []) -> PBXGroup? {
        guard let toGroup = toGroup else { return nil }
        // swiftlint:disable:next force_unwrapping
        do {
            return try toGroup.addGroup(named: groupName, options: options).last!
        } catch {
            return nil
        }
    }

    func addSourceFile(at filePath: Path, toGroup: PBXGroup, target: PBXTarget, sourceRoot: Path) throws {
//        let file = try pbxproj.objects.addFile(at: filePath, toGroup: toGroup, sourceRoot: sourceRoot)
//        _ = pbxproj.objects.addBuildFile(toTarget: target, reference: file.reference)
    }

}

//extension XcodeProj {
//    func target(named targetName: String) -> PBXTarget? {
//        pbxproj.targets(named: targetName).first
//    }
//
//    func fullPath<E: PBXFileElement>(fileElement: E, sourceRoot: Path) -> Path? {
//        do {
//            return try fileElement.fullPath(sourceRoot: sourceRoot)
//        } catch {
//            return nil
//        }
//    }
//
//    func sourceFilesPaths(target: PBXTarget, sourceRoot: Path) -> [Path] {
//        do {
//            return try target.sourceFiles()
//                .compactMap { fullPath(fileElement: $0, sourceRoot: sourceRoot) }
//        } catch {
//            return []
//        }
//    }
//
//    var rootGroup: PBXGroup? {
//        do {
//            return try pbxproj.rootGroup()
//        } catch {
//            return nil
//        }
//    }
//
//    func addGroup(named groupName: String, to toGroup: PBXGroup?, options: GroupAddingOptions = []) -> PBXGroup? {
//        guard let toGroup = toGroup else { return nil }
//        // swiftlint:disable:next force_unwrapping
//        do {
//            return try toGroup.addGroup(named: groupName, options: options).last!
//        } catch {
//            return nil
//        }
//    }
//
////    func addSourceFile(at filePath: Path, toGroup: PBXGroup, target: PBXTarget, sourceRoot: Path) throws {
////        let file = try toGroup.addFile(at: filePath, sourceRoot: sourceRoot)
//////        let file = try pbxproj.objects.addFile(at: filePath, toGroup: toGroup, sourceRoot: sourceRoot)
////        _ = pbxproj.objects.addBuildFile(toTarget: target, reference: file.reference)
////    }
//}
