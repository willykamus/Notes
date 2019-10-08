import UIKit

var str = "Hello, playground"
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
 
 
// MARK: Changes in presenting viewControllers
 
 If the modal presentation is in pagesheet and we want to prevent the user from swiping down the viewcontroller
 we now have access to a variable called modalInPresentation. This is only available in iOS13
 
 Setter
 self.modalInPresentation = true
 Getter
 self.isModalInPresentation
 
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
 
 */
