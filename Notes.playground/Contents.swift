import UIKit

var str = "Hello, playground"

// MARK: API Documentation

// http://linux-zake.local/mediawiki/index.php/Comparables_-_Set_Config

protocol ResponseHandler {
    
}

// MARK: Singleton

class LocationManager {
    static let shared = LocationManager()
    //Making the init private avoid to initialize a singleton again
    private init(){}
    
    func requestionLocation(){
        print("Location granted")
    }
}
// How to use the singleton
LocationManager.shared.requestionLocation()

// MARK: Dependency Injection

class DataManager {
    private var delegate: ResponseHandler
    init(delegate: ResponseHandler) {
        self.delegate = delegate
    }
    
    func requestData(){
        //Code here
    }
}

/*
func chipField(_ chipField: MDCChipField, didChangeInput input: String?) {
    if let timer = searchTimeout {
        timer.invalidate()
    }
    //deleted row
    searchTimeout = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
    //added row
    searchTimeout = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { timer in
            if let search = input, search.count > 2 {
                self.autoCompleteManager.getAutoCompleteResult(searchTerm: search)
            }
            else {
                self.results = []
                self.tableView.reloadData()
            }
        })
}
 
// MARK: Macro
 
 

// MARK: Swift Concepts
 
 // Lazy: The initialzer of the object is run the first time it is used instead at the moment of creation.
 
 
 
 
// MARK: Equatable
 
 Types that conform to the Equatable protocol can be compared for equality using the equal-to operator (==) or inequality using the not-equal-to operator (!=). Most basic types in the Swift standard library conform to Equatable.
 
 class StreetAddress {
     let number: String
     let street: String
     let unit: String?

     init(_ number: String, _ street: String, unit: String? = nil) {
         self.number = number
         self.street = street
         self.unit = unit
     }
 }
 
    If we need to compare two addresses without writing a closure everytime we can conform to the Equatable protocol
 
 extension StreetAddress: Equatable {
     static func == (lhs: StreetAddress, rhs: StreetAddress) -> Bool {
         return
             lhs.number == rhs.number &&
             lhs.street == rhs.street &&
             lhs.unit == rhs.unit
     }
 }
 
    The StreetAddress type now conforms to Equatable. You can use == to check for equality between any two instances or call the Equatable-constrained contains(_:) method.
 
 let addresses = [StreetAddress("1490", "Grove Street"),
                  StreetAddress("2119", "Maple Avenue"),
                  StreetAddress("1400", "16th Street")]
 let home = StreetAddress("1400", "16th Street")

 print(addresses[0] == home)
 // Prints "false"
 print(addresses.contains(home))
 // Prints "true"
 
 
// MARK: Cocoa pods
 
 // To install cocoapods tools
 sudo gem install cocoapods
 // Install pods inside project
 pod install
 // Update pods inside project
 pod update
 // Update the repository
 pod install --repo-update
 
 
// MARK: Jira and taking a ticket

 1. Select in status "Start Development" Note: Jira will automatically assing me to the task
 2. Create branch.
 3. Bitbucket will appear.
 4. Check that the type is the same as Jira. (Bugfix, development, etc)
 5. The branch is develop (for now)
 6. The branch name should be the same as the Jira
 7. Click create
 8. Checkout the branch so I will be working in the lastest
 9. It will ask to open sourcetree.
 10.Click chekcout on the popup, so I will be working in the branch created for the type. (Step 4)
 
// MARK: Git
 
 A branch that is merged might be deleted from origin. 
 
 
// MARK: Changes in presenting viewControllers
 
 If the modal presentation is in pagesheet and we want to prevent the user from swiping down the viewcontroller
 we now have access to a variable called modalInPresentation. This is only available in iOS13
 
 Setter
 self.modalInPresentation = true
 Getter
 self.isModalInPresentation
 
 .formSheet
 In a horizontally and vertically regular environment, this option adds a dimming layer over the background content and displays the view controller's content centered on the screen.
 The actual dimensions are smaller than those of the UIModalPresentationStyle.pageSheet presentation style, and a portion of the underlying content always remains visible.
 In cases where the underlying content remains visible, the presenting view controller doesn't receive the viewWillDisappear(_:) and viewDidDisappear(_:) callbacks.
 
// MARK: Navigagion Controller
 
 The navigation controller does not count in the stack view controller.
 
// MARK: PushNotifications
 
 In other to know if something happens inside the app, like a notification. We have to use observer that are listening or waiting for messages.
 
// MARK: Add Alpha to Nav bar with scrolling
 
 internal func setNavBarAlphas(contentOffset: CGPoint) {
     if let navCtrl = self.navigationController,
         let breakpoint = offsetDenominator {
         let alpha = contentOffset.y / breakpoint
         
         if alpha >= 1.0  {
             navCtrl.navigationBar.backgroundColor = self.TARGET_COLOR
             self.overlayView.backgroundColor = self.TARGET_COLOR
         } else {
             let targetCIColor = CIColor(cgColor: self.TARGET_COLOR.cgColor)
             let overlayColor = UIColor(red: targetCIColor.red, green: targetCIColor.green, blue: targetCIColor.blue, alpha: alpha)
             
             self.overlayView.backgroundColor = overlayColor
             navCtrl.navigationBar.backgroundColor = UIColor.clear
         }
     }
     
     if let navCtrl = self.navigationController, self.offsetTextDenominator > 0 {
         if UI_USER_INTERFACE_IDIOM() == .phone && UIApplication.shared.statusBarOrientation.isPortrait  {
             if contentOffset.y > self.offsetTextDenominator {
                 let alpha = (contentOffset.y - self.offsetTextDenominator) / self.offsetTextTransition
                 
                 if alpha >= 1.0  {
                     navCtrl.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                 } else {
                     let targetCIColor = CIColor(cgColor: UIColor.white.cgColor)
                     let titleColor = UIColor(red: targetCIColor.red, green: targetCIColor.green, blue: targetCIColor.blue, alpha: alpha)
                     navCtrl.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
                 }
             }
             else {
                 navCtrl.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
             }
         }
         else {
             navCtrl.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
         }
     }
 }
 
// MARK: UISearchBar
 
 This change the background color of the whole view
 self.searchBar.backgroundColor
 
 This change the color of the background of the textField
 self.searchBar.searchTextField.backgroundColor
 
// MARK: Constraints and UIFitting
 
 systemLayoutSizeFitting
 This function returns a CGSize which is the optimal size for the view that satisfies all the constraints and it is as close as the targetSize as possible
 
// MARK: Favorite Request
 
 The server will return the Agent Favourites if the request does not have any contact ID
 
 - (NSMutableDictionary*)jsonExtention
 
 if (numberNotZero(self.contactId))
 {
     self.mergedExtension[kGetFavoritesContactIdKey] = self.contactId;
 }
 else
 {
     [self.mergedExtension removeObjectForKey:kGetFavoritesContactIdKey];
 }
 
// MARK: Layout Configuration
 
 // Predicting Size Classes
    From iOS 13 it will predict the initial traits for a view. This means that if it guess right, the traitCollectionDidChange will not get triggered.
    If your app needs to respond to size class changes, it’s important you implement the traitCollectionDidChange method.
    There you can check the size class of the current trait collection and respond appropriately.
 
 override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
     if traitCollection.horizontalSizeClass == .compact {
         // load slim view
     } else {
         // load wide view
     }
 }
 
// MARK: UI
 
 setContentHuggingPriority(_:for:)
    high = will force the view to shrink to minimal space in the direction we specify
    low = it will take the as much space as it can compare to the one that is set to high
 
 setContentCompressionResistancePriority:forAxis:
    high = will prioritize the space requiere for the view against the other one
    low = i will truncate the view if it is necessary.
 
 
 

// MARK: GoMLS changes
 
 
 
 
 GOMLS-73
 - Remove the "X" in top right as it's action is accomplished by the "View Results" pill
 - Move "Reset" to top right
 
 // Previous (go to FilterSetviewController)
 
 let saveSearchEnabled = self.delegate?.filterSetViewControllerCanSaveSearch(self) ?? false
 self.navigationItem.leftBarButtonItems = saveSearchEnabled ?
 [UIBarButtonItem(customView: saveSearchButton), UIBarButtonItem(customView: resetButton)] :
 [UIBarButtonItem(customView: resetButton)]
 self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: closeButton)]
 
 // Later
 
 let saveSearchEnabled = self.delegate?.filterSetViewControllerCanSaveSearch(self) ?? false
 self.navigationItem.leftBarButtonItems = saveSearchEnabled ?
 [UIBarButtonItem(customView: saveSearchButton), ] : nil
 self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: resetButton)]
 
 - Change "View X Results" to "VIEW X RESULTS"
 
 // Previous (go to FilterSetviewController)
 
 private func updateButton() {
 DispatchQueue.main.async { [weak self] in
 guard let strongSelf = self else { return }
 strongSelf.resultsButton.title = DisplayableStrings.viewResults(with: strongSelf.resultCount)
 strongSelf.resultsButton.detail = DisplayableStrings.InTheCurrentMapArea
    }
 }
 
 // Later
 
 private func updateButton(){
 DispatchQueue.main.async { [weak self] in
 guard let strongSelf = self else { return }
 strongSelf.resultsButton.title = DisplayableStrings.viewResults(with: strongSelf.resultCount).uppercased()
 strongSelf.resultsButton.detail = DisplayableStrings.InTheCurrentMapArea
    }
 }
 
 - Change "In The Current Map Area" to "In the current map area"
 
 
 // Previous (go to LocalizedStrings.json)
 
 "InTheCurrentMapArea" : "In The Current Map Area"
 
 // Later
 
 "InTheCurrentMapArea" : "In the current map area"
 
 
 self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: closeButton)]
 
 */
