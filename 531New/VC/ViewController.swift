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
    

    @IBOutlet weak var setOneWeight: UIButton!
    @IBOutlet weak var setTwoWeight: UIButton!
    @IBOutlet weak var setThreeWeight: UIButton!
    @IBOutlet weak var setFourWeight: UIButton!
    @IBOutlet weak var setFiveWeight: UIButton!
    
    @IBOutlet weak var setOneSwitch: UISwitch!
    @IBOutlet weak var setTwoSwitch: UISwitch!
    @IBOutlet weak var setThreeSwitch: UISwitch!
    @IBOutlet weak var setFourSwitch: UISwitch!
    @IBOutlet weak var setFiveSwitch: UISwitch!
    
    @IBOutlet weak var saveWorkoutButton: UIButton!
    

    
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
            setOneWeight.setTitle(squatWeekOneWeight, for: .normal)
            setTwoWeight.setTitle(squatWeekOneWeight, for: .normal)
            setThreeWeight.setTitle(squatWeekOneWeight, for: .normal)
            setFourWeight.setTitle(squatWeekOneWeight, for: .normal)
            setFiveWeight.setTitle(squatWeekOneWeight, for: .normal)
            resetSwitches()
            
            
        }
            
        else if exercise == "Squat" && week == "Week 2" {
            
            squatWeekTwoWeight = "3 x " + String(ceil(squatWeight.weekTwo()))
            setOneWeight.setTitle(squatWeekTwoWeight, for: .normal)
            setTwoWeight.setTitle(squatWeekTwoWeight, for: .normal)
            setThreeWeight.setTitle(squatWeekTwoWeight, for: .normal)
            setFourWeight.setTitle(squatWeekTwoWeight, for: .normal)
            setFiveWeight.setTitle(squatWeekTwoWeight, for: .normal)
            resetSwitches()
        }
        
        else if exercise == "Squat" && week == "Week 3" {
            
            squatWeekThreeWeight = "2 x " + String(ceil(squatWeight.weekThree()))
            setOneWeight.setTitle(squatWeekThreeWeight, for: .normal)
            setTwoWeight.setTitle(squatWeekThreeWeight, for: .normal)
            setThreeWeight.setTitle(squatWeekThreeWeight, for: .normal)
            setFourWeight.setTitle(squatWeekThreeWeight, for: .normal)
            setFiveWeight.setTitle(squatWeekThreeWeight, for: .normal)
            resetSwitches()
        }
        
        else if exercise == "Squat" && week == "Week 4" {
            
            squatWeekFourWeight = "1 x " + String(ceil(squatWeight.weekFour()))
            setOneWeight.setTitle(squatWeekFourWeight, for: .normal)
            setTwoWeight.setTitle(squatWeekFourWeight, for: .normal)
            setThreeWeight.setTitle(squatWeekFourWeight, for: .normal)
            setFourWeight.setTitle(squatWeekFourWeight, for: .normal)
            setFiveWeight.setTitle(squatWeekFourWeight, for: .normal)
            resetSwitches()
        }
        
        
        // Overheadpress
            
        else if exercise == "Overhead Press" && week == "Week 1" {
            
            overheadpressWeekOneWeight = "5 x " + String(ceil(overheadpressWeight.weekOne()))
            setOneWeight.setTitle(overheadpressWeekOneWeight, for: .normal)
            setTwoWeight.setTitle(overheadpressWeekOneWeight, for: .normal)
            setThreeWeight.setTitle(overheadpressWeekOneWeight, for: .normal)
            setFourWeight.setTitle(overheadpressWeekOneWeight, for: .normal)
            setFiveWeight.setTitle(overheadpressWeekOneWeight, for: .normal)
            resetSwitches()
            
        }
            
        else if exercise == "Overhead Press" && week == "Week 2" {
            
            overheadpressWeekTwoWeight = "3 x " + String(ceil(overheadpressWeight.weekTwo()))
            setOneWeight.setTitle(overheadpressWeekTwoWeight, for: .normal)
            setTwoWeight.setTitle(overheadpressWeekTwoWeight, for: .normal)
            setThreeWeight.setTitle(overheadpressWeekTwoWeight, for: .normal)
            setFourWeight.setTitle(overheadpressWeekTwoWeight, for: .normal)
            setFiveWeight.setTitle(overheadpressWeekTwoWeight, for: .normal)
            resetSwitches()
        }
            
        else if exercise == "Overhead Press" && week == "Week 3" {
            overheadpressWeekThreeWeight = "2 x " + String(ceil(overheadpressWeight.weekThree()))
            setOneWeight.setTitle(overheadpressWeekThreeWeight, for: .normal)
            setTwoWeight.setTitle(overheadpressWeekThreeWeight, for: .normal)
            setThreeWeight.setTitle(overheadpressWeekThreeWeight, for: .normal)
            setFourWeight.setTitle(overheadpressWeekThreeWeight, for: .normal)
            setFiveWeight.setTitle(overheadpressWeekThreeWeight, for: .normal)
            resetSwitches()
        }
            
        else if exercise == "Overhead Press" && week == "Week 4" {
            overheadpressWeekFourWeight = "1 x " + String(ceil(overheadpressWeight.weekFour()))
            setOneWeight.setTitle(overheadpressWeekFourWeight, for: .normal)
            setTwoWeight.setTitle(overheadpressWeekFourWeight, for: .normal)
            setThreeWeight.setTitle(overheadpressWeekFourWeight, for: .normal)
            setFourWeight.setTitle(overheadpressWeekFourWeight, for: .normal)
            setFiveWeight.setTitle(overheadpressWeekFourWeight, for: .normal)
            resetSwitches()
        }
            
        // Deadlift
        
        else if exercise == "Deadlift" && week == "Week 1" {
            deadliftWeekOneWeight = "5 x " + String(ceil(deadliftWeight.weekOne()))
            setOneWeight.setTitle(deadliftWeekOneWeight, for: .normal)
            setTwoWeight.setTitle(deadliftWeekOneWeight, for: .normal)
            setThreeWeight.setTitle(deadliftWeekOneWeight, for: .normal)
            setFourWeight.setTitle(deadliftWeekOneWeight, for: .normal)
            setFiveWeight.setTitle(deadliftWeekOneWeight, for: .normal)
            resetSwitches()
            
        }
            
        else if exercise == "Deadlift" && week == "Week 2" {
            deadliftWeekTwoWeight = "3 x " + String(ceil(deadliftWeight.weekTwo()))
            setOneWeight.setTitle(deadliftWeekTwoWeight, for: .normal)
            setTwoWeight.setTitle(deadliftWeekTwoWeight, for: .normal)
            setThreeWeight.setTitle(deadliftWeekTwoWeight, for: .normal)
            setFourWeight.setTitle(deadliftWeekTwoWeight, for: .normal)
            setFiveWeight.setTitle(deadliftWeekTwoWeight, for: .normal)
            resetSwitches()
        }
            
        else if exercise == "Deadlift" && week == "Week 3" {
            deadliftWeekThreeWeight = "2 x " + String(ceil(deadliftWeight.weekThree()))
            setOneWeight.setTitle(deadliftWeekThreeWeight, for: .normal)
            setTwoWeight.setTitle(deadliftWeekThreeWeight, for: .normal)
            setThreeWeight.setTitle(deadliftWeekThreeWeight, for: .normal)
            setFourWeight.setTitle(deadliftWeekThreeWeight, for: .normal)
            setFiveWeight.setTitle(deadliftWeekThreeWeight, for: .normal)
            resetSwitches()
        }
            
        else if exercise == "Deadlift" && week == "Week 4" {
            deadliftWeekFourWeight = "1 x " + String(ceil(deadliftWeight.weekFour()))
            setOneWeight.setTitle(deadliftWeekFourWeight, for: .normal)
            setTwoWeight.setTitle(deadliftWeekFourWeight, for: .normal)
            setThreeWeight.setTitle(deadliftWeekFourWeight, for: .normal)
            setFourWeight.setTitle(deadliftWeekFourWeight, for: .normal)
            setFiveWeight.setTitle(deadliftWeekFourWeight, for: .normal)
            resetSwitches()
        }
        
        // Bench Press
        
        else if exercise == "Bench Press" && week == "Week 1" {
            benchpressWeekOneWeight = "5 x " + String(ceil(benchpressWeight.weekOne()))
            setOneWeight.setTitle(benchpressWeekOneWeight, for: .normal)
            setTwoWeight.setTitle(benchpressWeekOneWeight, for: .normal)
            setThreeWeight.setTitle(benchpressWeekOneWeight, for: .normal)
            setFourWeight.setTitle(benchpressWeekOneWeight, for: .normal)
            setFiveWeight.setTitle(benchpressWeekOneWeight, for: .normal)
            resetSwitches()
            
        }
            
        else if exercise == "Bench Press" && week == "Week 2" {
            benchpressWeekTwoWeight = "3 x " + String(ceil(benchpressWeight.weekTwo()))
            setOneWeight.setTitle(benchpressWeekTwoWeight, for: .normal)
            setTwoWeight.setTitle(benchpressWeekTwoWeight, for: .normal)
            setThreeWeight.setTitle(benchpressWeekTwoWeight, for: .normal)
            setFourWeight.setTitle(benchpressWeekTwoWeight, for: .normal)
            setFiveWeight.setTitle(benchpressWeekTwoWeight, for: .normal)
            resetSwitches()
        }
            
        else if exercise == "Bench Press" && week == "Week 3" {
            benchpressWeekThreeWeight = "2 x " + String(ceil(benchpressWeight.weekThree()))
            setOneWeight.setTitle(benchpressWeekThreeWeight, for: .normal)
            setTwoWeight.setTitle(benchpressWeekThreeWeight, for: .normal)
            setThreeWeight.setTitle(benchpressWeekThreeWeight, for: .normal)
            setFourWeight.setTitle(benchpressWeekThreeWeight, for: .normal)
            setFiveWeight.setTitle(benchpressWeekThreeWeight, for: .normal)
            resetSwitches()
        }
            
        else if exercise == "Bench Press" && week == "Week 4" {
            benchpressWeekFourWeight = "1 x " + String(ceil(benchpressWeight.weekFour()))
            setOneWeight.setTitle(benchpressWeekFourWeight, for: .normal)
            setTwoWeight.setTitle(benchpressWeekFourWeight, for: .normal)
            setThreeWeight.setTitle(benchpressWeekFourWeight, for: .normal)
            setFourWeight.setTitle(benchpressWeekFourWeight, for: .normal)
            setFiveWeight.setTitle(benchpressWeekFourWeight, for: .normal)
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
        guard let title = setOneWeight.currentTitle, !title.isEmpty else {
           return
        }
        
        guard let exercise = trainingLabel.text, !exercise.isEmpty else {
            return
        }
        
        
        let todo = Todo(context: managedContext)
        todo.title = title
        todo.date = Date()
        todo.exercise = trainingLabel.text
        
        
        
        do {
            try managedContext.save()
        } catch {
            print ("Error saving todo: \(error)")
        }
        
        dismiss(animated: true)
        
    }
    
    /*
    func getCurrentDateTime(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        dateAndTime = formatter.string(from: Date ())
        
    }
    */
    
    

    @IBAction func setSixWeightButton(_ sender: Any) {
        
    }
    
    
    
    
    
}









