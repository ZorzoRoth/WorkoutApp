//
//  ViewController.swift
//  531New
//
//  Created by Zoltan Puchovsky on 13/07/2019.
//  Copyright © 2019 Zoltan Puchovsky. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var managedContext: NSManagedObjectContext!

    
    
    @IBOutlet weak var squatOneRepMax: UITextField!
    @IBOutlet weak var overheadpressOneRepMax: UITextField!
    @IBOutlet weak var deadliftOneRepMax: UITextField!
    @IBOutlet weak var benchpressOneRepMax: UITextField!
    
    @IBOutlet weak var trainingLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var myPicker: UIPickerView!
    
    @IBOutlet weak var setOneWeight: UITextField!
    @IBOutlet weak var setTwoWeight: UITextField!
    @IBOutlet weak var setThreeWeight: UITextField!
    @IBOutlet weak var setFourWeight: UITextField!
    @IBOutlet weak var setFiveWeight: UITextField!
    
    
    @IBOutlet weak var setOneSwitch: UISwitch!
    @IBOutlet weak var setTwoSwitch: UISwitch!
    @IBOutlet weak var setThreeSwitch: UISwitch!
    @IBOutlet weak var setFourSwitch: UISwitch!
    @IBOutlet weak var setFiveSwitch: UISwitch!
    
    let pickerData = [["Squat","Overhead Press","Deadlift","Bench Press"],["Week 1","Week 2","Week 3" ,"Week 4"]]
    
    var squatWeekOneWeight = ""
    var squatWeekTwoWeight = ""
    var squatWeekThreeWeight = ""
    var squatWeekFourWeight = ""
    
    var overheadpressWeekOneWeight = ""
    var overheadpressWeekTwoWeight = ""
    var overheadpressWeekThreeWeight = ""
    var overheadpressWeekFourWeight = ""
   
    var deadliftWeekOneWeight = ""
    var deadliftWeekTwoWeight = ""
    var deadliftWeekThreeWeight = ""
    var deadliftWeekFourWeight = ""
    
    var benchpressWeekOneWeight = ""
    var benchpressWeekTwoWeight = ""
    var benchpressWeekThreeWeight = ""
    var benchpressWeekFourWeight = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        myPicker.delegate = self
        myPicker.dataSource = self
        
        
        let savedSquatOneRepMax = UserDefaults.standard.object(forKey: "SquatOneRepMaxSaved")
        if let squatOneRepMaxDisplayed = savedSquatOneRepMax as? String {
            squatOneRepMax.text = squatOneRepMaxDisplayed
        }
        
        let savedOverheadpressOneRepMax = UserDefaults.standard.object(forKey: "OverheadpressOneRepMaxSaved")
        if let overheadpressOneRepMaxDisplayed = savedOverheadpressOneRepMax as? String {
            overheadpressOneRepMax.text = overheadpressOneRepMaxDisplayed
        }
        
        let savedDeadliftOneRepMax = UserDefaults.standard.object(forKey: "DeadliftOneRepMaxSaved")
        if let deadliftOneRepMaxDisplayed = savedDeadliftOneRepMax as? String {
            deadliftOneRepMax.text = deadliftOneRepMaxDisplayed
        }
        
        let savedBenchpressOneRepMax = UserDefaults.standard.object(forKey: "BenchpressOneRepMaxSaved")
        if let benchpressOneRepMaxDisplayed = savedBenchpressOneRepMax as? String {
            benchpressOneRepMax.text = benchpressOneRepMaxDisplayed
        }
        
        
        
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateSetLabel()
    }
    

    
    func updateSetLabel() {
        let squatOneRepMaxInput = Double(squatOneRepMax.text!)
        let overheadpressOneRepMaxInput = Double(overheadpressOneRepMax.text!)
        let deadliftOneRepMaxInput = Double(deadliftOneRepMax.text!)
        let benchpressOneRepMaxInput = Double(benchpressOneRepMax.text!)
        
        UserDefaults.standard.set(squatOneRepMax.text, forKey: "SquatOneRepMaxSaved")
        UserDefaults.standard.set(overheadpressOneRepMax.text, forKey: "OverheadpressOneRepMaxSaved")
        UserDefaults.standard.set(deadliftOneRepMax.text, forKey: "DeadliftOneRepMaxSaved")
        UserDefaults.standard.set(benchpressOneRepMax.text, forKey: "BenchpressOneRepMaxSaved")
        
        
        let squatWeight = Squat(squatMax: squatOneRepMaxInput!)
        let overheadpressWeight = Overheadpress(overheadpressMax: overheadpressOneRepMaxInput!)
        let deadliftWeight = Deadlift(deadliftMax: deadliftOneRepMaxInput!)
        let benchpressWeight = Benchpress(benchpressMax: benchpressOneRepMaxInput!)

        
        let exercise = pickerData[0][myPicker.selectedRow(inComponent: 0)]
        let week = pickerData[1][myPicker.selectedRow(inComponent: 1)]
        trainingLabel.text = exercise
        weekLabel.text =  week
        
        
        
        
        // Squat
        
        
        
        if exercise == "Squat" && week == "Week 1" {
            
            squatWeekOneWeight = "5 x " + String(ceil(squatWeight.weekOne()))
            setOneWeight.text = squatWeekOneWeight
            setTwoWeight.text = squatWeekOneWeight
            setThreeWeight.text = squatWeekOneWeight
            setFourWeight.text = squatWeekOneWeight
            setFiveWeight.text = squatWeekOneWeight

            resetSwitches()
            
        }
            
        else if exercise == "Squat" && week == "Week 2" {
            
            squatWeekTwoWeight = "3 x " + String(ceil(squatWeight.weekTwo()))
            setOneWeight.text = squatWeekTwoWeight
            setTwoWeight.text = squatWeekTwoWeight
            setThreeWeight.text = squatWeekTwoWeight
            setFourWeight.text = squatWeekTwoWeight
            setFiveWeight.text = squatWeekTwoWeight
            resetSwitches()
        }
        
        else if exercise == "Squat" && week == "Week 3" {
            squatWeekThreeWeight = "2 x " + String(ceil(squatWeight.weekThree()))
            setOneWeight.text = squatWeekThreeWeight
            setTwoWeight.text = squatWeekThreeWeight
            setThreeWeight.text = squatWeekThreeWeight
            setFourWeight.text = squatWeekThreeWeight
            setFiveWeight.text = squatWeekThreeWeight
            resetSwitches()
        }
        
        else if exercise == "Squat" && week == "Week 4" {
            squatWeekFourWeight = "1 x " + String(ceil(squatWeight.weekFour()))
            setOneWeight.text = squatWeekFourWeight
            setTwoWeight.text = squatWeekFourWeight
            setThreeWeight.text = squatWeekFourWeight
            setFourWeight.text = squatWeekFourWeight
            setFiveWeight.text = squatWeekFourWeight
            resetSwitches()
        }
        
        
        // Overheadpress
            
        else if exercise == "Overhead Press" && week == "Week 1" {
            
            overheadpressWeekOneWeight = "5 x " + String(ceil(overheadpressWeight.weekOne()))
            setOneWeight.text = overheadpressWeekOneWeight
            setTwoWeight.text = overheadpressWeekOneWeight
            setThreeWeight.text = overheadpressWeekOneWeight
            setFourWeight.text = overheadpressWeekOneWeight
            setFiveWeight.text = overheadpressWeekOneWeight
            resetSwitches()
            
        }
            
        else if exercise == "Overhead Press" && week == "Week 2" {
            
            overheadpressWeekTwoWeight = "3 x " + String(ceil(overheadpressWeight.weekTwo()))
            setOneWeight.text = overheadpressWeekTwoWeight
            setTwoWeight.text = overheadpressWeekTwoWeight
            setThreeWeight.text = overheadpressWeekTwoWeight
            setFourWeight.text = overheadpressWeekTwoWeight
            setFiveWeight.text = overheadpressWeekTwoWeight
            resetSwitches()
        }
            
        else if exercise == "Overhead Press" && week == "Week 3" {
            overheadpressWeekThreeWeight = "2 x " + String(ceil(overheadpressWeight.weekThree()))
            setOneWeight.text = overheadpressWeekThreeWeight
            setTwoWeight.text = overheadpressWeekThreeWeight
            setThreeWeight.text = overheadpressWeekThreeWeight
            setFourWeight.text = overheadpressWeekThreeWeight
            setFiveWeight.text = overheadpressWeekThreeWeight
            resetSwitches()
        }
            
        else if exercise == "Overhead Press" && week == "Week 4" {
            overheadpressWeekFourWeight = "1 x " + String(ceil(overheadpressWeight.weekFour()))
            setOneWeight.text = overheadpressWeekFourWeight
            setTwoWeight.text = overheadpressWeekFourWeight
            setThreeWeight.text = overheadpressWeekFourWeight
            setFourWeight.text = overheadpressWeekFourWeight
            setFiveWeight.text = overheadpressWeekFourWeight
            resetSwitches()
        }
            
        // Deadlift
        
        else if exercise == "Deadlift" && week == "Week 1" {
            deadliftWeekOneWeight = "5 x " + String(ceil(deadliftWeight.weekOne()))
            setOneWeight.text = deadliftWeekOneWeight
            setTwoWeight.text = deadliftWeekOneWeight
            setThreeWeight.text = deadliftWeekOneWeight
            setFourWeight.text = deadliftWeekOneWeight
            setFiveWeight.text = deadliftWeekOneWeight
            resetSwitches()
            
        }
            
        else if exercise == "Deadlift" && week == "Week 2" {
            deadliftWeekTwoWeight = "3 x " + String(ceil(deadliftWeight.weekTwo()))
            setOneWeight.text = deadliftWeekTwoWeight
            setTwoWeight.text = deadliftWeekTwoWeight
            setThreeWeight.text = deadliftWeekTwoWeight
            setFourWeight.text = deadliftWeekTwoWeight
            setFiveWeight.text = deadliftWeekTwoWeight
            resetSwitches()
        }
            
        else if exercise == "Deadlift" && week == "Week 3" {
            deadliftWeekThreeWeight = "2 x " + String(ceil(deadliftWeight.weekThree()))
            setOneWeight.text = deadliftWeekThreeWeight
            setTwoWeight.text = deadliftWeekThreeWeight
            setThreeWeight.text = deadliftWeekThreeWeight
            setFourWeight.text = deadliftWeekThreeWeight
            setFiveWeight.text = deadliftWeekThreeWeight
            resetSwitches()
        }
            
        else if exercise == "Deadlift" && week == "Week 4" {
            deadliftWeekFourWeight = "1 x " + String(ceil(deadliftWeight.weekFour()))
            setOneWeight.text = deadliftWeekFourWeight
            setTwoWeight.text = deadliftWeekFourWeight
            setThreeWeight.text = deadliftWeekFourWeight
            setFourWeight.text = deadliftWeekFourWeight
            setFiveWeight.text = deadliftWeekFourWeight
            resetSwitches()
        }
        
        // Bench Press
        
        else if exercise == "Bench Press" && week == "Week 1" {
            benchpressWeekOneWeight = "5 x " + String(ceil(benchpressWeight.weekOne()))
            setOneWeight.text = benchpressWeekOneWeight
            setTwoWeight.text = benchpressWeekOneWeight
            setThreeWeight.text = benchpressWeekOneWeight
            setFourWeight.text = benchpressWeekOneWeight
            setFiveWeight.text = benchpressWeekOneWeight
            resetSwitches()
            
        }
            
        else if exercise == "Bench Press" && week == "Week 2" {
            benchpressWeekTwoWeight = "3 x " + String(ceil(benchpressWeight.weekTwo()))
            setOneWeight.text = benchpressWeekTwoWeight
            setTwoWeight.text = benchpressWeekTwoWeight
            setThreeWeight.text = benchpressWeekTwoWeight
            setFourWeight.text = benchpressWeekTwoWeight
            setFiveWeight.text = benchpressWeekTwoWeight
            resetSwitches()
        }
            
        else if exercise == "Bench Press" && week == "Week 3" {
            benchpressWeekThreeWeight = "2 x " + String(ceil(benchpressWeight.weekThree()))
            setOneWeight.text = benchpressWeekThreeWeight
            setTwoWeight.text = benchpressWeekThreeWeight
            setThreeWeight.text = benchpressWeekThreeWeight
            setFourWeight.text = benchpressWeekThreeWeight
            setFiveWeight.text = benchpressWeekThreeWeight
            resetSwitches()
        }
            
        else if exercise == "Bench Press" && week == "Week 4" {
            benchpressWeekFourWeight = "1 x " + String(ceil(benchpressWeight.weekFour()))
            setOneWeight.text = benchpressWeekFourWeight
            setTwoWeight.text = benchpressWeekFourWeight
            setThreeWeight.text = benchpressWeekFourWeight
            setFourWeight.text = benchpressWeekFourWeight
            setFiveWeight.text = benchpressWeekFourWeight
            resetSwitches()
        }
        
        
    }
    
    
    func resetSwitches () {
        setOneSwitch.isOn = false
        setTwoSwitch.isOn = false
        setThreeSwitch.isOn = false
        setFourSwitch.isOn = false
        setFiveSwitch.isOn = false
    }
    
    // dismisses the number pad when tapped outside of it's field
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    @IBAction func saveWorkoutButton(_ sender: Any) {
        guard let title = setOneWeight.text, !title.isEmpty else {
            return
        }
        
        let todo = Todo(context: managedContext)
        todo.title = title
        todo.date = Date()
        
        do {
            try managedContext.save()
        } catch {
            print ("Error saving todo: \(error)")
        }
        
        dismiss(animated: true)
        
    }
    
    
    
}







