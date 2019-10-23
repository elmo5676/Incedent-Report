//
//  ViewController.swift
//  Incedent Report
//
//  Created by Matthew Elmore on 10/15/19.
//  Copyright © 2019 Matthew Elmore. All rights reserved.
//

import UIKit

//class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIScrollViewDelegate {
    

class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    // MARK: - SetUp Variables
    var textFieldDelegate: UITextFieldDelegate?
    var dd = DropDowns()
    var activeTextField = 0
    
    // MARK: - Form Fields
    var dateV: Date                 = Date()
    var lastNameV                   = ""
    var firstNameV                  = ""
    var middleNameV                 = ""
    var rankV                       = ""
    var unitV                       = ""
    var phoneNumberV                = ""
    var phaseOfFlightV              = ""
    var headingV                    = ""
    var airspeedV                   = ""
    var altitudeV                   = ""
    var callSignV                   = ""
    var aircraftTypeV               = ""
    var tailNumberV                 = ""
    var sortieDurationV             = ""
    var locationV                   = ""
    var non9RWV                     = ""
    var systemsInvolvedV            = ""
    var sect_1_OtherV               = ""
    var lightingConditionsV         = ""
    var icingConditionsV            = ""
    var turbulanceV                 = ""
    var windsV                      = ""
    var visibilityV                 = ""
    var birdWatchCondV              = ""
    var numberOfBirdsV              = ""
    var wildLifeSizeV               = ""
    var airCraftImpactV             = ""
    var sect_3_checkAllThatApplyV   = ""
    var descriptionFreeTextV        = ""
    
    // MARK: - All
    @IBOutlet var allSubViews: [UIView]!
    @IBOutlet var fieldLabels: [UILabel]!
    @IBOutlet var buttonOutlets: [UIButton]!
    @IBOutlet var allTextFields: [UITextField]!
    @IBOutlet var allPickerTextFields: [PickerTextField]!
    @IBOutlet weak var scrollViewMain: UIScrollView!
    
    
    
    // MARK: - TITLE
    @IBOutlet weak var leftIconImage: UIImageView!
    @IBOutlet weak var rigthIconImage: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainSubTitleLabel: UILabel!
    @IBOutlet weak var mainBodyView: UIView!
    @IBOutlet weak var clearFormOutlet: UIButton!
    @IBAction func resetForm(_ sender: UIButton) {
        clearFormOutlet.showPressed()
    }
    
    // MARK: - SECTION I.  SORTIE INFORMATION/MISHAP DETAILS
    @IBOutlet weak var sectionOneView: UIView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var unitDropdown: PickerTextField!
    @IBOutlet weak var aircraftTypeDropdown: PickerTextField!
    @IBOutlet weak var phaseOfFlightDropdown: PickerTextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var middleName: UITextField!
    @IBOutlet weak var rank: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var heading: UITextField!
    @IBOutlet weak var airspeed: UITextField!
    @IBOutlet weak var altitude: UITextField!
    @IBOutlet weak var callSign: UITextField!
    @IBOutlet weak var tailNumber: UITextField!
    @IBOutlet weak var sortieHrs: UITextField!
    @IBOutlet weak var sortieDecHrs: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var non9RW: UITextField!
    @IBOutlet weak var sect_1_Other: UITextField!
    @IBOutlet weak var sect1_electrical: UISwitch!
    @IBOutlet weak var sect1_engine: UISwitch!
    @IBOutlet weak var sect1_enviro: UISwitch!
    @IBOutlet weak var sect1_flightControls: UISwitch!
    @IBOutlet weak var sect1_fuel: UISwitch!
    @IBOutlet weak var sect1_gear: UISwitch!
    @IBOutlet weak var sect1_hydro: UISwitch!
    @IBOutlet weak var sect1_instrument: UISwitch!
    @IBOutlet weak var sect1_payload: UISwitch!
    @IBOutlet weak var clearSect_1Outlet: UIButton!
    @IBOutlet var section1TextFields: [UITextField]!
    @IBOutlet var systemsSwitches: [UISwitch]!
    @IBAction func clearSect_1(_ sender: UIButton) {
        clearSect_1Outlet.showPressed()
    }
    
    // MARK: - SECTION II.  WEATHER CONDITIONS
    @IBOutlet weak var lightingDropdown: PickerTextField!
    @IBOutlet weak var visibilityDropdown: PickerTextField!
    @IBOutlet weak var turbulanceDropdown: PickerTextField!
    @IBOutlet weak var icingDropdown: PickerTextField!
    @IBOutlet weak var winds: UITextField!
    @IBOutlet weak var clearSect_2Outlet: UIButton!
    @IBAction func sect_1_Electrical(_ sender: UISwitch) {
    }
    @IBAction func sect_1_Engine(_ sender: UISwitch) {
    }
    @IBAction func sect_1_Enviro(_ sender: UISwitch) {
    }
    @IBAction func sect_1_FlightControls(_ sender: UISwitch) {
    }
    @IBAction func sect_1_Fuel(_ sender: UISwitch) {
    }
    @IBAction func sect_1_Gear(_ sender: UISwitch) {
    }
    @IBAction func sect_1_Hydro(_ sender: UISwitch) {
    }
    @IBAction func sect_1_Instrument(_ sender: UISwitch) {
    }
    @IBAction func sect_1_Payload(_ sender: UISwitch) {
    }
    @IBAction func clearSect_2(_ sender: UIButton) {
        clearSect_2Outlet.showPressed()
    }
    
    // MARK: - SECTION III.  FOR BIRD/WILDLIFE STRIKES
    @IBOutlet weak var birdWatchDropdown: PickerTextField!
    @IBOutlet weak var numberOfBirdsDropdown: PickerTextField!
    @IBOutlet weak var wildLifeSizeDropdown: PickerTextField!
    @IBOutlet weak var aircraftImpactPts: UITextField!
    @IBOutlet weak var sect3_sof: UISwitch!
    @IBOutlet weak var sect3_aircraftLandingLight: UISwitch!
    @IBOutlet weak var sect3_pilotWarning: UISwitch!
    @IBOutlet weak var clearSect_3Outlet: UIButton!
    @IBAction func sect_3_sof(_ sender: UISwitch) {
    }
    @IBAction func sect_3_aircraftLandingLight(_ sender: UISwitch) {
    }
    @IBAction func sect_3_pilotWarning(_ sender: UISwitch) {
    }
    @IBAction func clearSect_3(_ sender: UIButton) {
        clearSect_3Outlet.showPressed()
    }
    
    // MARK: - SECTION IV.  NARRATIVE COMMENTS
    @IBOutlet weak var clearSect_4Outlet: UIButton!
    @IBAction func clearSect_4(_ sender: UIButton) {
        clearSect_4Outlet.showPressed()
    }
    
    // MARK: - BOTTOM
    @IBOutlet weak var submitFormButtonOutlet: UIButton!
    @IBAction func submitFormButton(_ sender: UIButton) {
        submitFormButtonOutlet.showPressed()
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Dissapeared")
    }
    
    // MARK: - Functionality
    fileprivate func adjustScrollViewPosition(currentTextField i: Int?) {
        let j = Double(i!)
        scrollViewMain.contentOffset = CGPoint(x: 0.0, y: j)
    }
    
    fileprivate func adjustScrollViewPosition(offsetV i: Double) {
        scrollViewMain.contentOffset = CGPoint(x: 0.0, y: i)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        resetBGColorForTextFields()
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField)
        let i = allTextFields.firstIndex(of: textField)
        if textField == allTextFields[i!] {
            if i == allTextFields.count - 1 {
                textField.resignFirstResponder()
                return true
            }
            allTextFields[i! + 1].becomeFirstResponder()
//            print("TEXTFIELD: \(i!)")
        }
        
        
//        print("i: \(i!) ::: Count: \(allTextFields.count)")
        
//        switch textField {
//        case non9RW:
//            adjustScrollViewPosition(offsetV: 171.5)
//        case sect_1_Other:
//            adjustScrollViewPosition(offsetV: 745.5)
//        case visibilityDropdown:
//            adjustScrollViewPosition(offsetV: 984.0)
//        case aircraftImpactPts:
//            adjustScrollViewPosition(offsetV: 1070.0)
//        default:
//            print("NotAnchored")
//        }
        return true
    }
    @IBAction func test(_ sender: UITextField) {
        print("prmaryAction")
    }
    
    func resetBGColorForTextFields(){
        for tf in allTextFields {
            tf.textColor = .label
            tf.backgroundColor = .darkGray
    }}
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        
        //Section 1
        //Header:       0.0
        //Mission CC:   171.5
        //Unit:         213.5
        //PoF:          257.0
        //Airspeed:     301.0
        //CallSign:     345.5
        //TailNum:      389.0
        //Location:     433.0
        //Systems:      480.5
        
        //Section 2
        //Header:       745.5
        
        //Section 3
        //Header:       984.0
        
        //Section 4
        //Header:       1371.5
        
        
        
    }
    
    
    
    
    
    func initialSetup(){
        setUpPickerTextFields()
        textFieldDelegate = self
        for ptf in allPickerTextFields {
            ptf.delegate = self
        }
        scrollViewMain.delegate = self
        scrollViewMain.showsVerticalScrollIndicator = true
        self.hideKeyboardWhenTappedAround()
        let cr: CGFloat = 20
        let c: UIColor = .systemGray6
        let borderColor: CGColor = c.cgColor
        let borderWidth: CGFloat = 1
        leftIconImage.layer.cornerRadius = cr
        leftIconImage.layer.borderColor = borderColor
        leftIconImage.layer.borderWidth = borderWidth
        rigthIconImage.layer.cornerRadius = cr
        rigthIconImage.layer.borderColor = borderColor
        rigthIconImage.layer.borderWidth = borderWidth
        mainTitleLabel.adjustsFontSizeToFitWidth = true
        mainSubTitleLabel.adjustsFontSizeToFitWidth = true
        for sysSwitch in systemsSwitches{
            sysSwitch.onTintColor = #colorLiteral(red: 0.04106775671, green: 0, blue: 0.673119843, alpha: 1)
        }
        for textField in section1TextFields {
            textField.returnKeyType = .next
            textField.backgroundColor = .darkGray
            textField.clearButtonMode = .whileEditing
            textField.keyboardAppearance = .dark
            textField.spellCheckingType = .no
            textField.delegate = self
        }
        for label in fieldLabels {
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .right
        }
        for view in allSubViews {
            view.layer.cornerRadius = 10
            view.layer.borderWidth = 2
            view.layer.borderColor = borderColor
        }
        for button in buttonOutlets {
            button.clipsToBounds = true
            button.layer.cornerRadius = 5
            button.layer.borderColor = borderColor
            button.layer.borderWidth = borderWidth
        }
    }
    
    func setUpPickerTextFields(){
        unitDropdown.selectionItems = dd.unit
        aircraftTypeDropdown.selectionItems = dd.aircraftType
        phaseOfFlightDropdown.selectionItems = dd.phaseOfFlight
        lightingDropdown.selectionItems = dd.lightingConditions
        visibilityDropdown.selectionItems = dd.visibility
        turbulanceDropdown.selectionItems = dd.turbulence
        icingDropdown.selectionItems = dd.icingConditions
        birdWatchDropdown.selectionItems = dd.birdWatchCondition
        numberOfBirdsDropdown.selectionItems = dd.numberOfBirds
        wildLifeSizeDropdown.selectionItems = dd.wildlifeSize
    }
    
    
    
    
    
    
    
    
}

