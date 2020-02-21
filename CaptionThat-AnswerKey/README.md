# Coding-Assignment-02
Assigned: 2/12, Due: 2/19
---

## Objective: 

### The goal of this assignment is to recreate the concepts learned in the lectures and then make some enhancements. By now, you've learned quite a bit about Swift and iOS development. Now it's time to start a series of assignments that ensure you understand what we're learning.

Another goal is to get experience creating a Xcode project and type code in from scratch **Never copy/paste any of the code from any of the checkpoint projects I provide**

Review the resources I provide in this tutorial. If you get stuck and something won't compile, google your compiler errors first and try to resolve the problem yourself. See the **Need Help** section additional resources.

Type in the code and watch what Xcode does as you do so.

This assignment must be submitted using GitHub (you can find instructions [here]()) by end of day (Feb 19th). You may submit it multiple times if you wish. Only the last submission before the deadline will be counted.

This assignment is rather lengthy and combines 3 weeks of concepts. Please don't attempt to do the entire assignment in 1 night. These are critical building blocks and concepts you must master before advancing. 

---
### Overall Deliverable for assignment #2:

1. Allow a user to select a photo from their image gallery
2. Display the image with a random caption 

---
 
### Part 1.

Resources:
- [How to create a Single Application](https://developer.apple.com/documentation/xcode/creating_an_xcode_project_for_an_app) -- Ignore anything SwiftUI Related
- [How to create a new View Controller](https://vimeo.com/390542744)

1. Create a new Single Application Xcode project name `CaptionThat`

2. Create a new Cocoa Touch Class of type `ViewController` and name it `LandingViewController` 

3. Create a new Cocoa Touch Class of type `ViewController` and name it (example: `CaptionedViewController`)

4. Create a new Swift file named `Caption` and declare it type `struct` 

5. Create a new Swift file named `Picture` and declare it type `struct`. Add a property of type UIImage to your struct Picture called `image`

6. Create (3) new groups: named `Views`, `Controllers`, `Models` 

7. Drag the `Caption.swift`, `Quote.swift` classes into the **Models** group

8. Drag `CaptionedViewController.swift` and into **Controllers** group

---

### Part 2. Storyboard

Resources: 
- [Using Storyboards / Interface Builder](https://developer.apple.com/library/archive/documentation/ToolsLanguages/Conceptual/Xcode_Overview/UsingInterfaceBuilder.html#//apple_ref/doc/uid/TP40010215-CH42-SW1)
- [Storyboard Overview](https://developer.apple.com/library/archive/documentation/ToolsLanguages/Conceptual/Xcode_Overview/DesigningwithStoryboards.html#//apple_ref/doc/uid/TP40010215-CH43-SW1)
- [Controls Overview - Section: Build the Basic UI](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/BuildABasicUI.html#//apple_ref/doc/uid/TP40015214-CH5-SW1)

- 📹 of this part of this step [here](https://vimeo.com/390545652)

1. Open `Main.storyboard` and delete `ViewController` from the storyboard 

2. Drag a new View Controller on to the storyboard and set its type to `LandingViewController `

3. Make `LandingViewController ` the first view in the app 

4. Inject a Navigation Controller into the storyboard ([📹](https://vimeo.com/390544311))

5. Drag a `UIButton` on to `LandingViewController `'s view

6. Change `UIButton`'s title to say: Image Gallery 

7. Drag a `UILabel` on to `CaptionThatViewController`'s view

---

### Part 3. Connect Objects to Code
Resources:
- [Tutorial See section: Sending Messages to a User Interface Object Through an Outlet](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/ConnectTheUIToCode.html)
- [What are Actions]()
- [UILabel documentation](https://developer.apple.com/documentation/uikit/uilabel)

- 📹 of this step [here](https://vimeo.com/390545652)

1. Create an outlet connection between the `UILabel` that you made in **Part 2** to your  `LandingViewController` name the outlet: `authorLabel`

2. Create an action connection. Name the action `handleUserDidTapImageGallery`

3. In your Controllers folder,  select `LandingViewController.swift` and update your `authorLabel``s text programmatically to your name and email address. (Do not update the label text in the storyboard). It must be set in `LandingViewController.swift`

Hint: 
`authorLabel.text = <your-email-address>`

---

### Part 4. Checkpoint
Resources:
- [How to run your app on the SIMULATOR](https://developer.apple.com/documentation/xcode/running_your_app_in_the_simulator_or_on_a_device)
- [How to set a breakpoint in Xcode](https://medium.com/yay-its-erica/xcode-debugging-with-breakpoints-for-beginners-5b0d0a39d711)

1. Set a breakpoint on `func handleUserDidTapImageGallery`

2. Check your work. Build your app (Command + B) and Run your app on the simulator. 

3. Tap the button and verify the breakpoint hits `handleUserDidTapImageGallery`

---
### Part 5. `UIImagePickerController`

Resources:
- [Delegate Review](https://github.com/SyracuseUniversity-CIS444/CIS-444/blob/master/Lectures/L7%20Swift%20Programming%20Language/CIS-444-Lecture-07.md/#Delegation)
- [Protocol Review](https://github.com/SyracuseUniversity-CIS444/CIS-444/blob/master/Lectures/L7%20Swift%20Programming%20Language/CIS-444-Lecture-07.md/#Protocol)
- [UIImagePickerController Documentation](https://developer.apple.com/documentation/uikit/uiimagepickercontroller)
- [PickerControllerDelegate](https://developer.apple.com/documentation/uikit/uiimagepickercontrollerdelegate)

1. Declare `LandingViewController.swift` as a `PickerControllerDelegate` and a `UINavigationControllerDelegate` 
2. Add the required methods needed to conform to be a  `PickerControllerDelegate`
3. In `LandingViewController.swift` Instantiate a `UIImagePickerController` and set the picker source

```swift
extension LandingViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func showImagePicker() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image"]
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = false
        pickerController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
}
```

---
### Part 6. Handle Image Selection. 

<<__We're going to grab the image from the image gallery and pass it along to another View Controller__>>

1. In your `PickerControllerDelegate` method: `imagePickerController(_:didFinishPickingMediaWithInfo:)` retrieve the `UIImage` and create a `Picture` struct using the image we extract from the delegate callback

```swift
 func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Run everything in defer **last**
        defer { picker.dismiss(animated: true, completion: nil) }
        
        // Retrieve the image I selected
        guard let image = (info[.originalImage] ?? info[.editedImage]) as? UIImage else {
            assertionFailure("Failed to retrieve image after image picker told us an image was picked")
                   return
               }
        // Create a Picture instance
        Picture(image: image)
    }


    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Do nothing. We have nothing to handle here. Dismiss the picker
        picker.dismiss(animated: true, completion: nil)
    }
```

---
### Part 7. Create a new Cocoa Touch Class `CaptionedViewController.swift` 


---
### Part 8. We need to create a screen that will show the image we picked and the randomly selected caption. A view controller we named `CaptionedViewController` will be responsible for that. I provided a video to watch first and documentation for this step. (Also see segue lecture)

Resources:
- [What are segues](https://digitalleaves.com/segues-navigation-ios-basics/)
- [How to create segues](https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/UsingSegues.html)
- 📹 of this step [here](https://vimeo.com/390535183)

After you watched the video do the following:

1. Add `CaptionedViewController` to `Main.storyboard`

2. Add `CaptionedViewController` to `Main.storyboard` and create a segue of type **Show (Push)** 

3. Create a segue between `LandingViewController` and `CaptionedViewController` and name it `LandingToCaptionedSegue` (or whatever you want)

(Not in video but do this:)
4. From the storyboard's asset catalog, drag a `UIImageView` into `CaptionedViewController`'s view and create an outlet connection named `userImageView`

---
### Part 9. We will use the segue we created in **Step 8** to pass along the `Picture` we created in `LandingViewController` to `CaptionedViewController` 

Resources:
[Documentation: performSegue](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621413-performsegue) 
[How to perform a segue programmatically using `performSegue`](https://digitalleaves.com/define-segues-programmatically)

1. After we retrieve the image selected in the picker, we want to instantiate `LandingViewController` and pass along the `Picture` for `LandingViewController` to display. Lets start with instantiating `LandingViewController`

```swift
  /// Calls the `LandingToCaptionedSegue` with the Picture as an argument
    func initalizeCaptionView(with picture: Picture) {
        /// make sure identifier matches the value you set in  Main.Storyboard
        self.performSegue(withIdentifier: "LandingToCaptionedSegue", sender: nil)
    }
```

2. Call `initalizeCaptionView` from our Delegate method `imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])`

3. Run the app and see what happens 

This is what your app should look like so far: [Progress](https://vimeo.com/390532546)

---
### Part 10. 

Looks pretty underwhelming so far, huh? That's because in the previous step we retrieve the image, created a Picture struct, and push `CaptionedViewController` on to the navigation stack. But we never pass the Picture object along with it.

How do we do that? 


---
### Part 11.


---
### Part 12.

---
### Part 13.

---
### Part 14.

---
### Part 15.

---
### Extra Credit



---
## Additional Resources 
- [Common Xcode Errors](https://github.com/SyracuseUniversity-CIS444/CIS-444/wiki/Common-Xcode-Errors)
- [Additional Resources](https://github.com/SyracuseUniversity-CIS444/CIS-444/wiki/Additional-Resources)



