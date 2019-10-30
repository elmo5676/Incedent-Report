//
//  ViewController.swift
//  Incedent Report
//
//  Created by Matthew Elmore on 10/15/19.
//  Copyright © 2019 Matthew Elmore. All rights reserved.
//

import UIKit

struct Incedent {
    var uuidV: UUID
    var dateV: Date
    var lastNameV: String
    var firstNameV: String
    var middleNameV: String
    var rankV: String
    var unitV: String
    var phoneNumberV: String
    var phaseOfFlightV: String
    var headingV: String
    var airspeedV: String
    var altitudeV: String
    var altTypeV: String
    var callSignV: String
    var aircraftTypeV: String
    var tailNumberV: String
    var sortieDurationHrsV: String
    var sortieDurationDecHrsV: String
    var locationV: String
    var non9RWV: String
    var systemsInvolvedV: [String:Bool]
    var sect_1_OtherV: String
    var lightingConditionsV: String
    var icingConditionsV: String
    var turbulanceV: String
    var windsV: String
    var visibilityV: String
    var birdConStepV: String
    var birdConIncedentV: String
    var numberOfBirdsV: String
    var wildLifeSizeV: String
    var airCraftImpactV: String
    var sect_3_checkAllThatApplyV: [String:Bool]
    var descriptionFreeTextV: String
    
    init(uuidV: UUID,
        dateV: Date?,
         lastNameV: String?,
         firstNameV: String?,
         middleNameV: String?,
         rankV: String?,
         unitV: String?,
         phoneNumberV: String?,
         phaseOfFlightV: String?,
         headingV: String?,
         airspeedV: String?,
         altitudeV: String?,
         altTypeV: String?,
         callSignV: String?,
         aircraftTypeV: String?,
         tailNumberV: String?,
         sortieDurationHrsV: String?,
         sortieDurationDecHrsV: String?,
         locationV: String?,
         non9RWV: String?,
         systemsInvolvedV: [String:Bool]?,
         sect_1_OtherV: String?,
         lightingConditionsV: String?,
         icingConditionsV: String?,
         turbulanceV: String?,
         windsV: String?,
         visibilityV: String?,
         birdConStepV: String?,
         birdConIncedentV: String?,
         numberOfBirdsV: String?,
         wildLifeSizeV: String?,
         airCraftImpactV: String?,
         sect_3_checkAllThatApplyV: [String:Bool]?,
         descriptionFreeTextV: String?) {
        self.uuidV = uuidV
        self.dateV = dateV ?? Date()
        self.lastNameV = lastNameV ?? ""
        self.firstNameV = firstNameV ?? ""
        self.middleNameV = middleNameV ?? ""
        self.rankV = rankV ?? ""
        self.unitV = unitV ?? ""
        self.phoneNumberV = phoneNumberV ?? ""
        self.phaseOfFlightV = phaseOfFlightV ?? ""
        self.headingV = headingV ?? ""
        self.airspeedV = airspeedV ?? ""
        self.altitudeV = altitudeV ?? ""
        self.altTypeV = altTypeV ?? ""
        self.callSignV = callSignV ?? ""
        self.aircraftTypeV = aircraftTypeV ?? ""
        self.tailNumberV = tailNumberV ?? ""
        self.sortieDurationHrsV = sortieDurationHrsV ?? ""
        self.sortieDurationDecHrsV = sortieDurationDecHrsV ?? ""
        self.locationV = locationV ?? ""
        self.non9RWV = non9RWV ?? ""
        self.systemsInvolvedV = systemsInvolvedV ?? [:]
        self.sect_1_OtherV = sect_1_OtherV ?? ""
        self.lightingConditionsV = lightingConditionsV ?? ""
        self.icingConditionsV = icingConditionsV ?? ""
        self.turbulanceV = turbulanceV ?? ""
        self.windsV = windsV ?? ""
        self.visibilityV = visibilityV ?? ""
        self.birdConStepV = birdConStepV ?? ""
        self.birdConIncedentV = birdConIncedentV ?? ""
        self.numberOfBirdsV = numberOfBirdsV ?? ""
        self.wildLifeSizeV = wildLifeSizeV ?? ""
        self.airCraftImpactV = airCraftImpactV ?? ""
        self.sect_3_checkAllThatApplyV = sect_3_checkAllThatApplyV ?? [:]
        self.descriptionFreeTextV = descriptionFreeTextV ?? ""
    }
    
}


class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    // MARK: - SetUp Variables
    var textFieldDelegate: UITextFieldDelegate?
    var dd = DropDowns()
    var activeTextField = 0
    
    // MARK: - Form Fields
    var dateV                       = Date()
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
    var altTypeV                    = "MSL"
    var callSignV                   = ""
    var aircraftTypeV               = ""
    var tailNumberV                 = ""
    var sortieDurationHrsV          = ""
    var sortieDurationDecHrsV       = ""
    var locationV                   = ""
    var non9RWV                     = ""
    var systemsInvolvedV: [String:Bool] = ["ELECTRICAL":false,"FLIGHT CONTROLS":false,
                                           "HYDRAULIC":false,"ENGINE":false,
                                           "FUEL":false,"INSTRUMENTATION":false,
                                           "ENVIRO/PRESSURE":false,"GEAR/BRAKES":false,
                                           "PAYLOAD":false]
    var sect_1_OtherV               = ""
    var lightingConditionsV         = ""
    var icingConditionsV            = ""
    var turbulanceV                 = ""
    var windsV                      = ""
    var visibilityV                 = ""
    var birdWatchCondV              = ""
    var birdConStepV                = ""
    var birdConIncedentV            = ""
    var numberOfBirdsV              = ""
    var wildLifeSizeV               = ""
    var airCraftImpactV             = ""
    var sect_3_checkAllThatApplyV: [String:Bool] = ["BIRDMAN PERFORMING DUTIES":false, "SOF/ATC WARNING OF BIRD HAZARD": false, "AIRCRAFT LANDING LIGHT ON":false, "PILOT WARNING PRIOR TO IMPACT": false]
    var descriptionFreeTextV        = ""
    
    // MARK: - All
    @IBOutlet var allSubViews: [UIView]!
    @IBOutlet var fieldLabels: [UILabel]!
    @IBOutlet var buttonOutlets: [UIButton]!
    @IBOutlet var allTextFields: [UITextField]!
    @IBOutlet var allSwitches: [UISwitch]!
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
        resetAll()
    }
    
    func resetAll() {
        clearSection5()
        clearSection4()
        clearSection3()
        clearSection2()
        clearSection1()
    }
    
    // MARK: - SECTION I.  SORTIE INFORMATION/MISHAP DETAILS
    @IBOutlet weak var sectionOneView: UIView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var unitDropdown: PickerTextField!
    @IBOutlet weak var aircraftTypeDropdown: PickerTextField!
    @IBOutlet weak var phaseOfFlightDropdown: PickerTextField!
    @IBOutlet weak var rankDropDown: PickerTextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var middleName: UITextField!
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
    @IBOutlet var section_1_Switches: [UISwitch]!
    @IBOutlet weak var dateAndTimePickerOutlet: UIDatePicker!
    @IBOutlet weak var aglMslSegmentControl: UISegmentedControl!
    var section1TextFields: [UITextField] = []
    
    //DATE PICKER
    @IBAction func dateAndTimePicker(_ sender: UIDatePicker) {
        dateV = sender.date
    }
    
    //TEXTFIELDS
    @IBAction func lastNameTF(_ sender: UITextField) {
        lastNameV = sender.text ?? ""
    }
    @IBAction func firstNameTF(_ sender: UITextField) {
        firstNameV = sender.text ?? ""
    }
    @IBAction func middleNameTF(_ sender: UITextField) {
        middleNameV = sender.text ?? ""
    }
    @IBAction func rankTF(_ sender: UITextField) {
        rankV = sender.text ?? ""
    }
    @IBAction func unitTF(_ sender: UITextField) {
        unitV = sender.text ?? ""
    }
    @IBAction func phoneNumberTF(_ sender: UITextField) {
        phoneNumberV = sender.text ?? ""
    }
    @IBAction func phaseOfFlightTF(_ sender: UITextField) {
        phaseOfFlightV = sender.text ?? ""
    }
    @IBAction func headingTF(_ sender: UITextField) {
        headingV = sender.text ?? ""
    }
    @IBAction func airspeedTF(_ sender: UITextField) {
        airspeedV = sender.text ?? ""
    }
    @IBAction func altitudeTF(_ sender: UITextField) {
        altitudeV = sender.text ?? ""
    }
    @IBAction func callSignTF(_ sender: UITextField) {
        callSignV = sender.text ?? ""
    }
    @IBAction func airCraftTypeTF(_ sender: UITextField) {
        aircraftTypeV = sender.text ?? ""
    }
    @IBAction func tailNumberTF(_ sender: UITextField) {
        tailNumberV = sender.text ?? ""
    }
    @IBAction func sortieDurationHrsTF(_ sender: UITextField) {
        sortieDurationHrsV = sender.text ?? ""
    }
    @IBAction func sortieDurationDecHrsTF(_ sender: UITextField) {
        sortieDurationDecHrsV = sender.text ?? ""
    }
    @IBAction func locationTF(_ sender: UITextField) {
        locationV = sender.text ?? ""
    }
    @IBAction func non9RWTF(_ sender: UITextField) {
        non9RWV = sender.text ?? ""
    }
    @IBAction func section1OtherTF(_ sender: UITextField) {
        sect_1_OtherV = sender.text ?? ""
    }
    
    //SYSTEM SWITCHES
    @IBAction func systemELECTRICALswitch(_ sender: UISwitch) {
        setSystemInvolved(key: "ELECTRICAL", to: sender.isOn)
    }
    @IBAction func systemFLIGHTCONTROLSswitch(_ sender: UISwitch) {
        setSystemInvolved(key: "FLIGHT CONTROLS", to: sender.isOn)
    }
    @IBAction func systemHYDRAULICswitch(_ sender: UISwitch) {
        setSystemInvolved(key: "HYDRAULIC", to: sender.isOn)
    }
    @IBAction func systemENGINEswitch(_ sender: UISwitch) {
        setSystemInvolved(key: "ENGINE", to: sender.isOn)
    }
    @IBAction func systemFUELswitch(_ sender: UISwitch) {
        setSystemInvolved(key: "FUEL", to: sender.isOn)
    }
    @IBAction func systemINSTRUMENTATIONswitch(_ sender: UISwitch) {
        setSystemInvolved(key: "INSTRUMENTATION", to: sender.isOn)
    }
    @IBAction func systemENVIROswitch(_ sender: UISwitch) {
        setSystemInvolved(key: "ENVIRO/PRESSURE", to: sender.isOn)
    }
    @IBAction func systemGEARswitch(_ sender: UISwitch) {
        setSystemInvolved(key: "GEAR/BRAKES", to: sender.isOn)
    }
    @IBAction func systemPAYLOADswitch(_ sender: UISwitch) {
        setSystemInvolved(key: "PAYLOAD", to: sender.isOn)
    }
    
    func setSystemInvolved(key: String, to: Bool) {
        switch to {
        case true:
            systemsInvolvedV[key] = true
        case false:
            systemsInvolvedV[key] = false
        }}
    
    @IBAction func aglMslSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            altTypeV = "AGL"
        case 1:
            altTypeV = "MSL"
        default:
            print("No Soup for you!!")
        }}
    
    @IBAction func clearSect_1(_ sender: UIButton) {
        clearSect_1Outlet.showPressed()
        clearSection1()
    }
    
    func clearSection1(){
        dateV = Date()
        lastNameV = ""
        firstNameV = ""
        middleNameV = ""
        rankV = ""
        unitV = ""
        phoneNumberV = ""
        phaseOfFlightV = ""
        headingV = ""
        airspeedV = ""
        altitudeV = ""
        altTypeV = "MSL"
        callSignV = ""
        aircraftTypeV = ""
        tailNumberV = ""
        sortieDurationHrsV = ""
        sortieDurationDecHrsV = ""
        locationV = ""
        non9RWV = ""
        sect_1_OtherV = ""
        for (key, _) in systemsInvolvedV {
            systemsInvolvedV["\(key)"] = false
        }
        aglMslSegmentControl.selectedSegmentIndex = 1
        dateAndTimePickerOutlet.date = Date()
        for tf in section1TextFields {
            tf.text?.removeAll()
            section1TextFields[0].becomeFirstResponder()
        }
        for sw in section_1_Switches {
            sw.isOn = false
        }}
    
    // MARK: - SECTION II.  WEATHER CONDITIONS
    @IBOutlet weak var lightingDropdown: PickerTextField!
    @IBOutlet weak var visibilityDropdown: PickerTextField!
    @IBOutlet weak var turbulanceDropdown: PickerTextField!
    @IBOutlet weak var icingDropdown: PickerTextField!
    @IBOutlet weak var winds: UITextField!
    var section2TextFields: [UITextField] = []
    @IBOutlet weak var clearSect_2Outlet: UIButton!
    @IBAction func clearSect_2(_ sender: UIButton) {
        clearSect_2Outlet.showPressed()
        clearSection2()
    }
    @IBAction func lightingConditionsTF(_ sender: UITextField) {
        lightingConditionsV = sender.text ?? ""
    }
    @IBAction func icingConditionsTF(_ sender: UITextField) {
        icingConditionsV = sender.text ?? ""
    }
    @IBAction func turbulanceTF(_ sender: UITextField) {
        turbulanceV = sender.text ?? ""
    }
    @IBAction func windsTF(_ sender: UITextField) {
        windsV = sender.text ?? ""
    }
    @IBAction func visibilityTF(_ sender: UITextField) {
        visibilityV = sender.text ?? ""
    }
    
    func clearSection2() {
        lightingConditionsV = ""
        icingConditionsV = ""
        turbulanceV = ""
        windsV = ""
        visibilityV = ""
        for tf in section2TextFields {
            tf.text?.removeAll()
            section2TextFields[0].becomeFirstResponder()
        }}
    
    // MARK: - SECTION III.  FOR BIRD/WILDLIFE STRIKES
    @IBOutlet weak var birdConStepDropdown: PickerTextField!
    @IBOutlet weak var birdConIncedentDropdown: PickerTextField!
    @IBOutlet weak var birdWatchDropdown: PickerTextField!
    @IBOutlet weak var numberOfBirdsDropdown: PickerTextField!
    @IBOutlet weak var wildLifeSizeDropdown: PickerTextField!
    @IBOutlet weak var aircraftImpactPts: UITextField!
    @IBOutlet weak var sect3_birdMan: UISwitch!
    @IBOutlet weak var sect3_sof: UISwitch!
    @IBOutlet weak var sect3_aircraftLandingLight: UISwitch!
    @IBOutlet weak var sect3_pilotWarning: UISwitch!
    var section3TextFields: [UITextField] = []
    @IBOutlet var section_3_Switches: [UISwitch]!
    @IBOutlet weak var clearSect_3Outlet: UIButton!
    @IBAction func clearSect_3(_ sender: UIButton) {
        clearSect_3Outlet.showPressed()
        clearSection3()
    }
    @IBAction func birdWatchConditionTF(_ sender: UITextField) {
        birdWatchCondV = sender.text ?? ""
    }
    @IBAction func numberOfBirdsTF(_ sender: UITextField) {
        numberOfBirdsV = sender.text ?? ""
    }
    @IBAction func wildLifeSizeTF(_ sender: UITextField) {
        wildLifeSizeV = sender.text ?? ""
    }
    @IBAction func impactPointsTF(_ sender: UITextField) {
        airCraftImpactV = sender.text ?? ""
    }
    @IBAction func birdManswitch(_ sender: UISwitch) {
        sect_3_checkAllThatApplyV["BIRDMAN PERFORMING DUTIES"] = sender.isOn
    }
    @IBAction func sofAtcswitch(_ sender: UISwitch) {
        sect_3_checkAllThatApplyV["SOF/ATC WARNING OF BIRD HAZARD"] = sender.isOn
    }
    @IBAction func acLandingLightswitch(_ sender: UISwitch) {
        sect_3_checkAllThatApplyV["AIRCRAFT LANDING LIGHT ON"] = sender.isOn
    }
    @IBAction func pilotWarningswitch(_ sender: UISwitch) {
        sect_3_checkAllThatApplyV["PILOT WARNING PRIOR TO IMPACT"] = sender.isOn
    }
    
    func clearSection3() {
        birdWatchCondV = ""
        numberOfBirdsV = ""
        wildLifeSizeV = ""
        airCraftImpactV = ""
        for sw in section_3_Switches {
            sw.isOn = false
        }
        for (key, _) in sect_3_checkAllThatApplyV {
            sect_3_checkAllThatApplyV[key] = false
        }
        for tf in section3TextFields {
            tf.text?.removeAll()
            section3TextFields[0].becomeFirstResponder()
        }}
    

    // MARK: - SECTION IV.  NARRATIVE COMMENTS
    @IBOutlet weak var incedentDescriptionTextBoxOutlet: UITextView!
    @IBOutlet weak var clearSect_4Outlet: UIButton!
    @IBAction func clearSect_4(_ sender: UIButton) {
        clearSect_4Outlet.showPressed()
        clearSection4()
    }
    
    func clearSection4() {
        incedentDescriptionTextBoxOutlet.text = ""
    }
    
    // MARK: - SECTION V.  MISCELLANEOUS
    var section5TextFields: [UITextField] = []
    
    func clearSection5() {
        
    }
    
    func setTextFieldOrder(){
        section1TextFields = [lastName, firstName, middleName, rankDropDown, unitDropdown, phoneNumber, phaseOfFlightDropdown, heading, airspeed, altitude, callSign, aircraftTypeDropdown, tailNumber, sortieHrs, sortieDecHrs, location, non9RW]
        section2TextFields = [lightingDropdown,icingDropdown,turbulanceDropdown,winds,visibilityDropdown]
        section3TextFields = [birdConStepDropdown,birdConIncedentDropdown,numberOfBirdsDropdown,wildLifeSizeDropdown,aircraftImpactPts]
//        section5TextFields = [<#HERE#>,<#HERE#>,<#HERE#>,<#HERE#>,<#HERE#>,<#HERE#>,<#HERE#>,<#HERE#>,<#HERE#>,<#HERE#>,<#HERE#>,<#HERE#>,<#HERE#>]
    }

    
    // MARK: - BOTTOM
    @IBOutlet weak var submitFormButtonOutlet: UIButton!
    @IBAction func submitFormButton(_ sender: UIButton) {
        submitFormButtonOutlet.showPressed()
        submitForm()
    }
    
    func submitForm() {
        let uuid = UUID()
        self.descriptionFreeTextV = incedentDescriptionTextBoxOutlet.text
        let newIncedent = Incedent(uuidV: uuid, dateV: dateV, lastNameV: lastNameV, firstNameV: firstNameV, middleNameV: middleNameV, rankV: rankV, unitV: unitV, phoneNumberV: phoneNumberV, phaseOfFlightV: phaseOfFlightV, headingV: headingV, airspeedV: airspeedV, altitudeV: altitudeV, altTypeV: altTypeV, callSignV: callSignV, aircraftTypeV: aircraftTypeV, tailNumberV: tailNumberV, sortieDurationHrsV: sortieDurationHrsV, sortieDurationDecHrsV: sortieDurationDecHrsV,locationV: locationV, non9RWV: non9RWV, systemsInvolvedV: systemsInvolvedV, sect_1_OtherV: sect_1_OtherV, lightingConditionsV: lightingConditionsV, icingConditionsV: icingConditionsV, turbulanceV: turbulanceV, windsV: windsV, visibilityV: visibilityV, birdConStepV: birdConStepV, birdConIncedentV: birdConIncedentV, numberOfBirdsV: numberOfBirdsV, wildLifeSizeV: wildLifeSizeV, airCraftImpactV: airCraftImpactV, sect_3_checkAllThatApplyV: sect_3_checkAllThatApplyV, descriptionFreeTextV: descriptionFreeTextV)
        print(newIncedent)
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
    // MARK: ScrollView
//    fileprivate func adjustScrollViewPosition(currentTextField i: Int?) {
//        let j = Double(i!)
//        scrollViewMain.contentOffset = CGPoint(x: 0.0, y: j)
//    }
//    fileprivate func adjustScrollViewPosition(offsetV i: Double) {
//        scrollViewMain.contentOffset = CGPoint(x: 0.0, y: i)
//    }
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
    
    
    // MARK: TextFields
    func textFieldDidBeginEditing(_ textField: UITextField) {
        resetBGColorForTextFields()
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let i = allTextFields.firstIndex(of: textField)
        if textField == allTextFields[i!] {
            if i == allTextFields.count - 1 {
                textField.resignFirstResponder()
                return
            }
            allTextFields[i! + 1].becomeFirstResponder()
        }}
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField)
        let i = allTextFields.firstIndex(of: textField)
        if textField == allTextFields[i!] {
            if i == allTextFields.count - 1 {
                textField.resignFirstResponder()
                return true
            }
            allTextFields[i! + 1].becomeFirstResponder()
        }
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
    func resetBGColorForTextFields(){
        for tf in allTextFields {
            tf.textColor = .label
            tf.backgroundColor = .darkGray
        }}
    
    
    
    func initialSetup(){
        aglMslSegmentControl.selectedSegmentIndex = 1
        setTextFieldOrder()
        setUpPickerTextFields()
        textFieldDelegate = self
        for ptf in allTextFields {
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
        for sysSwitch in allSwitches {
            sysSwitch.onTintColor = #colorLiteral(red: 0.04106775671, green: 0, blue: 0.673119843, alpha: 1)
        }
        for textField in allTextFields {
            textField.returnKeyType = .next
            textField.backgroundColor = .darkGray
            textField.clearButtonMode = .whileEditing
            textField.keyboardAppearance = .dark
            textField.spellCheckingType = .no
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
        }}
    
    func setUpPickerTextFields(){
        rankDropDown.selectionItems             = dd.rank
        unitDropdown.selectionItems             = dd.unit
        aircraftTypeDropdown.selectionItems     = dd.aircraftType
        phaseOfFlightDropdown.selectionItems    = dd.phaseOfFlight
        lightingDropdown.selectionItems         = dd.lightingConditions
        visibilityDropdown.selectionItems       = dd.visibility
        turbulanceDropdown.selectionItems       = dd.turbulence
        icingDropdown.selectionItems            = dd.icingConditions
        birdConStepDropdown.selectionItems      = dd.birdWatchCondition
        birdConIncedentDropdown.selectionItems  = dd.birdWatchCondition
        numberOfBirdsDropdown.selectionItems    = dd.numberOfBirds
        wildLifeSizeDropdown.selectionItems     = dd.wildlifeSize
    }
    
    
    
    
    
    
    
    
}

//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }
//    @IBAction func <#here#>TF(_ sender: UITextField) {
//    }

//    @IBAction func system<#here#>switch(_ sender: UISwitch) {
//    }
//    @IBAction func system<#here#>switch(_ sender: UISwitch) {
//    }
//    @IBAction func system<#here#>switch(_ sender: UISwitch) {
//    }
//    @IBAction func system<#here#>switch(_ sender: UISwitch) {
//    }
//    @IBAction func system<#here#>switch(_ sender: UISwitch) {
//    }
//    @IBAction func system<#here#>switch(_ sender: UISwitch) {
//    }
//    @IBAction func system<#here#>switch(_ sender: UISwitch) {
//    }
//    @IBAction func system<#here#>switch(_ sender: UISwitch) {
//    }
//    @IBAction func system<#here#>switch(_ sender: UISwitch) {
//    }
    
