
import SwiftUI

#if os(iOS)
import UIKit

open class DynamicIcon {

    // Used to decoded base64-encoded hidden private API names strings
    static private func decoder(_ string: String) -> String? {
        guard let base64EncodedData = string.data(using: .utf8) else { return nil }
        guard let decodedData = Data(base64Encoded: base64EncodedData) else { return nil }
        return String(data: decodedData, encoding: .utf8)
    }

    /// Exposes this as a shortcut through the package
    static var supportsAlternateIcons: Bool {
        UIApplication.shared.supportsAlternateIcons
    }

    /// Changes the application icon with no limit of any kind
    /// - Parameter name: Name of the applicatin saved in your Assets.xcassets.
    /// - Returns: `true` if icon has been changed.
    static func setAlternateIconName(_ name: String? = nil) -> Bool {

        guard UIApplication.shared.supportsAlternateIcons else { return false }
        guard UIApplication.shared.alternateIconName != name
           || UIApplication.shared.alternateIconName == nil  else { return false }

        // Base64-encoded private API names strings
        let LSBPClassName = decoder("TFNCdW5kbGVQcm94eQ==")!
        let LSBPMethodName = decoder("YnVuZGxlUHJveHlGb3JDdXJyZW50UHJvY2Vzcw==")!
        let LSARMethodName = decoder("c2V0QWx0ZXJuYXRlSWNvbk5hbWU6Y29tcGxldGlvbkhhbmRsZXI6")!

        guard let LSBPClass = (NSClassFromString(LSBPClassName) as? NSObject.Type)
        else { return false }

        guard let proxy = LSBPClass.perform(NSSelectorFromString(LSBPMethodName)).takeUnretainedValue() as? NSObject
        else { return false }

        let setIconSelector = NSSelectorFromString(LSARMethodName)

        let completionBlock: @convention(block) (Bool, Error?) -> Void = { _, _ in }

        let completion = unsafeBitCast(completionBlock as @convention(block) (Bool, Error?) -> Void, to: AnyObject.self)

        proxy.perform(setIconSelector, with: name, with: completion)

        return true
    }
}
#endif
