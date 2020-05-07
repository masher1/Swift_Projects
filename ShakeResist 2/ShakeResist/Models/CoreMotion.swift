//
//  CoreMotion.swift
//  ShakeResist
//
//  Created by Malkiel Asher on 5/6/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//
/*
File Description: This file was created to collect the Accelerometer Data using the CoreMotion Framework.
 The detailed instructions are listed below
*/

import Foundation
import CoreMotion

//This is a helper Model created to aide in collecting the accelerometer data and sending that data to a new View Controller that will then dictate the position of the content

/*
 Steps to achieve the CoreMotion integration
 * Get x,y,z values from the Accelerometer using the startAccelerometer function.
 * Calibrate the screen's X, Y, and Z values so you have something to compare to later.
 * Compare the X,Y,Z values to the ones collected while callibrating by subtracting one from another.
 * Send an NSNotification to the PresenterViewController in which you will be presenting the content from.
 * Once in the PresenterViewController, assign the passed in values as the constraints for the content TextView.
 */



let motion = CMMotionManager()

//func startAccelerometers() {
//   // Make sure the accelerometer hardware is available.
//   if self.motion.isAccelerometerAvailable {
//      self.motion.accelerometerUpdateInterval = 1.0 / 60.0  // 60 Hz
//      self.motion.startAccelerometerUpdates()
//
//      // Configure a timer to fetch the data.
//      self.timer = Timer(fire: Date(), interval: (1.0/60.0),
//            repeats: true, block: { (timer) in
//         // Get the accelerometer data.
//         if let data = self.motion.accelerometerData {
//            let x = data.acceleration.x
//            let y = data.acceleration.y
//            let z = data.acceleration.z
//
//            // Use the accelerometer data in your app.
//         }
//      })
//
//      // Add the timer to the current run loop.
//      RunLoop.current.add(self.timer!, forMode: .defaultRunLoopMode)
//   }
//}


//This might help in the future with resizing the TextView (optional)
//https://medium.com/@how_noobs_think/how-to-resize-a-textview-to-fit-its-content-re-sizing-textview-based-on-its-contentsize-fe4f5dab461e

//Empty Table View
//http://www.benmeline.com/ios-empty-table-view-with-swift/

//Github link for Empty State
//https://github.com/luispadron/UIEmptyState

//make an NSNotification:
//to send a message to the PresentingViewController
//change the textView size as you get the Notification from this file
