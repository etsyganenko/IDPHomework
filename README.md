# Tabata SDK for iOS

- [Installation](#installation)
- [Usage](#usage)

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Tabata SDK into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, ‘8.1’
use_frameworks!

target '<Your Target Name>' do
    pod 'TabataSDK', :git => 'https://github.com/TabaTa-platform/tabata-ios-sdk.git', :branch => 'develop'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

### Initialization

```swift
import TabataSDK

TBTAuthorizationManager.sharedInstance.startAuthorization(onViewController: self,
                                                          withLocale: NSLocale.currentLocale(),
                                                          integrationID: "nhv87ytf",
                                                          additionalData: nil,
                                                          appearance: nil)
```

- `onViewController` - view controller responsible for presenting TabataSDK UI
- `withLocale` - locale to be applied in TabataSDK (not implemented in Authorization module)
- `integrationID` - unique identifier (8 alphanumeric characters)
- `additionalData` - (optional) list of TBTProfileAttribute instances
- `appearance` - (optional) TBTAppearance instance for UI customization

### Passing additional user profile data

```swift
let editableData = TBTProfileAttribute(title: "title", value: "value", type: .Editable)
let confirmationData = TBTProfileAttribute(title: "title1", value: "value1", type: .NeedsConfirmation)
let nonEditableData = TBTProfileAttribute(title: "title2", value: "value2", type: .NonEditable)

TBTAuthorizationManager.sharedInstance.startAuthorization(onViewController: self,
                                                          withLocale: NSLocale.currentLocale(),
                                                          integrationID: "nhv87ytf",
                                                          additionalData: [editableData, 
                                                                           confirmationData, 
                                                                           nonEditableData],
                                                          appearance: nil)
```

### UI customization

```swift
let appearance = TBTAppearance(backgroundColor: UIColor.lightGrayColor(),
                               mainButtonColor: UIColor.greenColor(),
                               backButtonColor: UIColor.redColor(),
                               descriptionTextFont: UIFont(name: "HelveticaNeue-Thin ", size: 20))
                               
TBTAuthorizationManager.sharedInstance.startAuthorization(onViewController: self,
                                                          withLocale: NSLocale.currentLocale(),
                                                          integrationID: "nhv87ytf",
                                                          additionalData: nil,
                                                          appearance: appearance)                               
```

**Full list of customizable UI elements**
- `backgroundColor`
- `mainButtonColor`
- `mainButtonTextColor`
- `mainButtonTextFont`
- `secondaryButtonTextColor`
- `secondaryButtonTextFont`
- `backButtonColor`
- `mainTitleTextColor`
- `mainTitleTextFont`
- `secondaryTitleTextColor`
- `secondaryTitleTextFont`
- `inputTextColor`
- `inputTextFont`
- `descriptionTextColor`
- `descriptionTextFont`
- `horizontalLineColor`
