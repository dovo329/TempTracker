//
//  ViewController.swift
//  TemperatureTracker
//
//  Created by Douglas Voss on 11/21/17.
//  Copyright © 2017 VossWareLLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tempTracker = TempTracker(temperatures: [5, 4, 2, 1, 4, 3])
        tempTracker.insert(temperature: 8)
        
        do {
            let max = try tempTracker.getMax()
            print("max: \(max)")
        } catch {
            print("Error getting max: \(error.localizedDescription)")
        }
        
        do {
            let min = try tempTracker.getMin()
            print("min: \(min)")
        } catch {
            print("Error getting min: \(error.localizedDescription)")
        }
        
        do {
            let mean = try tempTracker.getMean()
            print("mean: \(mean)")
        } catch {
            print("Error getting mean: \(error.localizedDescription)")
        }
        
        do {
            let mode = try tempTracker.getMode()
            print("mode: \(mode)")
        } catch {
            print("Error getting mode: \(error.localizedDescription)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

