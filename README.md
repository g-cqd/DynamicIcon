# DynamicIcon

Swift API to change application icon without any limit nor having a dialog presented.  

This uses Apple private APIs. It did not trigger App Store rejection for me but, do tell it if it does for you.

## Install

### Recommended

Copy [DynamicIcon.swift](https://github.com/g-cqd/DynamicIcon/blob/main/Sources/DynamicIcon/DynamicIcon.swift) to your project.

### SPM

To add a package dependency to your Xcode project, select File > Add Package and enter this repository's URL (<https://github.com/g-cqd/DynamicIcon>).

## Example

First, create AppIcon iconsets in your assets and use their names in the code below.
You can reset the icon to the original one by passing `nil` as argument of the method.

```swift
import SwiftUI
import DynamicIcon

struct ContentView: View {
    
    struct Icons {
        static var blue = "AppIcon1"
        static var red = "AppIcon2"
    }
    
    var body: some View {
        VStack {
            Button("Set Icon to Blue") {
                DynamicIcon.setAlternateIconName(Icons.blue)
            }
            Button("Set Icon to Red") {
                DynamicIcon.setAlternateIconName(Icons.red)
            }
            Button("Reset") {
                DynamicIcon.setAlternateIconName(nil)
            }
        }
    }
}
```
