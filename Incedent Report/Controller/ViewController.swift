//
//  ViewController.swift
//  Incedent Report
//
//  Created by Matthew Elmore on 10/15/19.
//  Copyright © 2019 Matthew Elmore. All rights reserved.
//

//Scroll Position
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

import UIKit
import AWSAppSync

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Dissapeared")
    }
    
    // MARK: - SetUp Variables
    var textFieldDelegate: UITextFieldDelegate?
    var dd = DropDowns()
    var activeTextField = 0
    var appSyncClient: AWSAppSyncClient?
    
    // MARK: - Form Fields
    //Section 1
    var dateV                       = Date()
    var lastNameV                   = "BLANK"
    var firstNameV                  = "BLANK"
    var middleNameV                 = "BLANK"
    var rankV                       = "BLANK"
    var unitV                       = "BLANK"
    var phoneNumberV                = "BLANK"
    var phaseOfFlightV              = "BLANK"
    var headingV                    = "BLANK"
    var airspeedV                   = "BLANK"
    var altitudeV                   = "BLANK"
    var altTypeV                    = "MSL"
    var callSignV                   = "BLANK"
    var aircraftTypeV               = "BLANK"
    var tailNumberV                 = "BLANK"
    var sortieDurationHrsV          = "BLANK"
    var sortieDurationDecHrsV       = "BLANK"
    var locationV                   = "BLANK"
    var non9RWV                     = "BLANK"
    var siElectricalV               = false
    var siFlightControlsV           = false
    var siHydraulicV                = false
    var siEngineV                   = false
    var siFuelV                     = false
    var siInstrumentationV          = false
    var siEnviroPressureV           = false
    var siGearBrakesV               = false
    var siPayloadV                  = false
    var sect_1_OtherV               = "BLANK"

    //Section 2
    var lightingConditionsV         = "BLANK"
    var icingConditionsV            = "BLANK"
    var turbulanceV                 = "BLANK"
    var windsV                      = "BLANK"
    var visibilityV                 = "BLANK"
    
    //Section 3
    var birdWatchCondV              = "BLANK"
    var birdConStepV                = "BLANK"
    var birdConIncedentV            = "BLANK"
    var numberOfBirdsV              = "BLANK"
    var wildLifeSizeV               = "BLANK"
    var airCraftImpactV             = "BLANK"
    
    var birdManDoingDutyV           = false { didSet {
        updateIndicatorLabel(birdManYorNLabel, with: birdManDoingDutyV)
        }}
    var sofAtcWarningV              = false { didSet {
        updateIndicatorLabel(sofAtcWarningYorNLabel, with: sofAtcWarningV)
        }}
    var aircraftLandingLightOnV     = false { didSet {
        updateIndicatorLabel(aircraftLandingLightYorNLabel, with: aircraftLandingLightOnV)
        }}
    var pilotWarningPriorToImpactV  = false { didSet {
        updateIndicatorLabel(pilotWarningYorNLabel, with: pilotWarningPriorToImpactV)
        }}
    
    //Section 4
    var descriptionFreeTextV        = "BLANK"
    var checklistsRanV              = "BLANK"
    var feedBackV                   = "BLANK"
    
    //Section 5
    var emergencyDeclaredV          = false { didSet {
        updateIndicatorLabel(emergencyYNLabel, with: emergencyDeclaredV)
        }}
    var shutDownV                   = false { didSet {
        updateIndicatorLabel(shutDownYNLabel, with: shutDownV)
        hideShutDownLocItems(shutDownV)
        }}
    var shutDownLocV                = "BLANK"
    
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
        lastNameV = sender.text ?? "BLANK"
    }
    @IBAction func firstNameTF(_ sender: UITextField) {
        firstNameV = sender.text ?? "BLANK"
    }
    @IBAction func middleNameTF(_ sender: UITextField) {
        middleNameV = sender.text ?? "BLANK"
    }
    @IBAction func rankTF(_ sender: UITextField) {
        rankV = sender.text ?? "BLANK"
    }
    @IBAction func unitTF(_ sender: UITextField) {
        unitV = sender.text ?? "BLANK"
    }
    @IBAction func phoneNumberTF(_ sender: UITextField) {
        phoneNumberV = sender.text ?? "BLANK"
    }
    @IBAction func phaseOfFlightTF(_ sender: UITextField) {
        phaseOfFlightV = sender.text ?? "BLANK"
    }
    @IBAction func headingTF(_ sender: UITextField) {
        headingV = sender.text ?? "BLANK"
    }
    @IBAction func airspeedTF(_ sender: UITextField) {
        airspeedV = sender.text ?? "BLANK"
    }
    @IBAction func altitudeTF(_ sender: UITextField) {
        altitudeV = sender.text ?? "BLANK"
    }
    @IBAction func callSignTF(_ sender: UITextField) {
        callSignV = sender.text ?? "BLANK"
    }
    @IBAction func airCraftTypeTF(_ sender: UITextField) {
        aircraftTypeV = sender.text ?? "BLANK"
    }
    @IBAction func tailNumberTF(_ sender: UITextField) {
        tailNumberV = sender.text ?? "BLANK"
    }
    @IBAction func sortieDurationHrsTF(_ sender: UITextField) {
        sortieDurationHrsV = sender.text ?? "BLANK"
    }
    @IBAction func sortieDurationDecHrsTF(_ sender: UITextField) {
        sortieDurationDecHrsV = sender.text ?? "BLANK"
    }
    @IBAction func locationTF(_ sender: UITextField) {
        locationV = sender.text ?? "BLANK"
    }
    @IBAction func non9RWTF(_ sender: UITextField) {
        non9RWV = sender.text ?? "BLANK"
    }
    @IBAction func section1OtherTF(_ sender: UITextField) {
        sect_1_OtherV = sender.text ?? "BLANK"
    }
    
    //SYSTEM SWITCHES
    @IBAction func systemELECTRICALswitch(_ sender: UISwitch) {
        siElectricalV = sender.isOn
    }
    @IBAction func systemFLIGHTCONTROLSswitch(_ sender: UISwitch) {
        siFlightControlsV = sender.isOn
    }
    @IBAction func systemHYDRAULICswitch(_ sender: UISwitch) {
        siHydraulicV = sender.isOn
    }
    @IBAction func systemENGINEswitch(_ sender: UISwitch) {
        siEngineV = sender.isOn
    }
    @IBAction func systemFUELswitch(_ sender: UISwitch) {
        siFuelV = sender.isOn
    }
    @IBAction func systemINSTRUMENTATIONswitch(_ sender: UISwitch) {
        siInstrumentationV = sender.isOn
    }
    @IBAction func systemENVIROswitch(_ sender: UISwitch) {
        siEnviroPressureV = sender.isOn
    }
    @IBAction func systemGEARswitch(_ sender: UISwitch) {
        siGearBrakesV = sender.isOn
    }
    @IBAction func systemPAYLOADswitch(_ sender: UISwitch) {
        siPayloadV = sender.isOn
    }
    
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
        lightingConditionsV = sender.text ?? "BLANK"
    }
    @IBAction func icingConditionsTF(_ sender: UITextField) {
        icingConditionsV = sender.text ?? "BLANK"
    }
    @IBAction func turbulanceTF(_ sender: UITextField) {
        turbulanceV = sender.text ?? "BLANK"
    }
    @IBAction func windsTF(_ sender: UITextField) {
        windsV = sender.text ?? "BLANK"
    }
    @IBAction func visibilityTF(_ sender: UITextField) {
        visibilityV = sender.text ?? "BLANK"
    }
    
    // MARK: - SECTION III.  FOR BIRD/WILDLIFE STRIKES
    @IBOutlet weak var birdConStepDropdown: PickerTextField!
    @IBOutlet weak var birdConIncedentDropdown: PickerTextField!
    @IBOutlet weak var numberOfBirdsDropdown: PickerTextField!
    @IBOutlet weak var wildLifeSizeDropdown: PickerTextField!
    @IBOutlet weak var aircraftImpactPts: UITextField!
    @IBOutlet weak var sect3_birdMan: UISwitch!
    @IBOutlet weak var birdManYorNLabel: UILabel!
    @IBOutlet weak var sect3_sof: UISwitch!
    @IBOutlet weak var sofAtcWarningYorNLabel: UILabel!
    @IBOutlet weak var sect3_aircraftLandingLight: UISwitch!
    @IBOutlet weak var aircraftLandingLightYorNLabel: UILabel!
    @IBOutlet weak var sect3_pilotWarning: UISwitch!
    @IBOutlet weak var pilotWarningYorNLabel: UILabel!
    var section3TextFields: [UITextField] = []
    @IBOutlet var section_3_Switches: [UISwitch]!
    @IBOutlet weak var clearSect_3Outlet: UIButton!
    @IBAction func clearSect_3(_ sender: UIButton) {
        clearSect_3Outlet.showPressed()
        clearSection3()
    }
    @IBAction func birdWatchConditionTF(_ sender: UITextField) {
        birdWatchCondV = sender.text ?? "BLANK"
    }
    @IBAction func numberOfBirdsTF(_ sender: UITextField) {
        numberOfBirdsV = sender.text ?? "BLANK"
    }
    @IBAction func wildLifeSizeTF(_ sender: UITextField) {
        wildLifeSizeV = sender.text ?? "BLANK"
    }
    @IBAction func impactPointsTF(_ sender: UITextField) {
        airCraftImpactV = sender.text ?? "BLANK"
    }
    @IBAction func birdManswitch(_ sender: UISwitch) {
        birdManDoingDutyV = sender.isOn
    }
    @IBAction func sofAtcswitch(_ sender: UISwitch) {
        sofAtcWarningV = sender.isOn
    }
    @IBAction func acLandingLightswitch(_ sender: UISwitch) {
        aircraftLandingLightOnV = sender.isOn
    }
    @IBAction func pilotWarningswitch(_ sender: UISwitch) {
        pilotWarningPriorToImpactV = sender.isOn
    }

    // MARK: - SECTION IV.  NARRATIVE COMMENTS
    @IBOutlet weak var incedentDescriptionTextViewOutlet: UITextView!
    @IBOutlet weak var checklistsRanTextViewOutlet: UITextView!
    @IBOutlet weak var feedBackTextViewOutlet: UITextView!
    @IBOutlet weak var clearSect_4Outlet: UIButton!
    @IBAction func clearSect_4(_ sender: UIButton) {
        clearSect_4Outlet.showPressed()
        clearSection4()
    }
    
    // MARK: - SECTION V.  MISCELLANEOUS
    var section5TextFields: [UITextField] = []
    @IBOutlet weak var emergencySwitch: UISwitch!
    @IBOutlet weak var emergencyYNLabel: UILabel!
    @IBOutlet weak var shutDownYNLabel: UILabel!
    @IBOutlet weak var shutDownSwitch: UISwitch!
    @IBOutlet weak var shutDownLocTitleLabel: UILabel!
    @IBOutlet weak var shutDownDropdown: PickerTextField!
    @IBOutlet var section_5_Switches: [UISwitch]!
    @IBOutlet weak var clearSection5Outlet: UIButton!
    
    @IBAction func emergencyDeclaredswitch(_ sender: UISwitch) {
        emergencyDeclaredV = sender.isOn
    }
    @IBAction func shutDownswitch(_ sender: UISwitch) {
        shutDownV = sender.isOn
    }
    @IBAction func shutDownLocDropDown(_ sender: UITextField) {
        shutDownLocV = sender.text ?? "BLANK"
    }
    
    @IBAction func clearSection5(_ sender: UIButton) {
        clearSection5Outlet.showPressed()
        clearSection5()
    }
    
    // MARK: - BOTTOM
    @IBOutlet weak var submitFormButtonOutlet: UIButton!
    @IBAction func submitFormButton(_ sender: UIButton) {
        submitFormButtonOutlet.showPressed()
        let ni = createNewIncedent()
        runMutation(incedent: ni)
    }
    
    // MARK: - Functionality
    
    //ScrollView
    func adjustScrollViewPosition(currentTextField i: Int?) {
        let j = Double(i!)
        scrollViewMain.contentOffset = CGPoint(x: 0.0, y: j)
    }
    
    func adjustScrollViewPosition(offsetV i: Double) {
        scrollViewMain.contentOffset = CGPoint(x: 0.0, y: i)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    
    //TextFields
    func textFieldDidBeginEditing(_ textField: UITextField) {
        resetBGColorForTextFields()
        switch self.traitCollection.userInterfaceStyle {
        case .dark:
            textField.backgroundColor = .lightGray// #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        case .light:
            textField.backgroundColor = .darkGray
            textField.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        default:
            textField.backgroundColor = .lightGray
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let i = allTextFields.firstIndex(of: textField)
        if textField == allTextFields[i!] {
            if i == allTextFields.count - 1 {
                textField.resignFirstResponder()
                return
            }
//            allTextFields[i! + 1].becomeFirstResponder()
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
        return true
    }
    
    func resetBGColorForTextFields(){
        for tf in allTextFields {
            tf.textColor = .label
            switch self.traitCollection.userInterfaceStyle {
            case .dark:
                tf.backgroundColor = .darkGray
            case .light:
                tf.backgroundColor = .lightGray
            default:
                tf.backgroundColor = .lightGray
                
            }}}
    
    func initialSetup(){
        aglMslSegmentControl.selectedSegmentIndex = 1
        hideShutDownLocItems(shutDownV)
        setTextFieldOrder()
        setUpPickerTextFields()
        textFieldDelegate = self
        for ptf in allTextFields {
            ptf.delegate = self
        }
//        scrollViewMain.delegate = self
//        scrollViewMain.showsVerticalScrollIndicator = true
        self.hideKeyboardWhenTappedAround()
        let cr: CGFloat = 20
        let c: UIColor = .systemGray6
        let borderColor: CGColor = c.cgColor
        let borderWidth: CGFloat = 0.3
        leftIconImage.layer.cornerRadius = cr
        leftIconImage.layer.borderColor = borderColor
        leftIconImage.layer.borderWidth = borderWidth
        rigthIconImage.layer.cornerRadius = cr
        rigthIconImage.layer.borderColor = borderColor
        rigthIconImage.layer.borderWidth = borderWidth
        mainTitleLabel.adjustsFontSizeToFitWidth = true
        mainSubTitleLabel.adjustsFontSizeToFitWidth = true
        for sysSwitch in allSwitches {
            switch self.traitCollection.userInterfaceStyle {
            case .dark:
                sysSwitch.onTintColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
            case .light:
                sysSwitch.onTintColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
            default:
                print("No Clue")
            }}
        for textField in allTextFields {
            switch self.traitCollection.userInterfaceStyle {
            case .dark:
                textField.backgroundColor = .darkGray
            case .light:
                textField.backgroundColor = .lightGray
            default:
                textField.backgroundColor = .lightGray
            }
            textField.returnKeyType = .next
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
        shutDownDropdown.selectionItems         = dd.shutDownLoc
    }
    
    func clearSection1(){
    dateV                                       = Date()
    lastNameV 	                                = "BLANK"
    firstNameV                                  = "BLANK"
    middleNameV                                 = "BLANK"
    rankV                                       = "BLANK"
    unitV 	                                    = "BLANK"
    phoneNumberV                                = "BLANK"
    phaseOfFlightV                              = "BLANK"
    headingV                                    = "BLANK"
    airspeedV                                   = "BLANK"
    altitudeV                                   = "BLANK"
    altTypeV                                    = "MSL"
    callSignV                                   = "BLANK"
    aircraftTypeV                               = "BLANK"
    tailNumberV                                 = "BLANK"
    sortieDurationHrsV                          = "BLANK"
    sortieDurationDecHrsV                       = "BLANK"
    locationV                                   = "BLANK"
    non9RWV                                     = "BLANK"
    sect_1_OtherV                               = "BLANK"
    siElectricalV                               = false
    siFlightControlsV                           = false
    siHydraulicV                                = false
    siEngineV                                   = false
    siFuelV                                     = false
    siInstrumentationV                          = false
    siEnviroPressureV                           = false
    siGearBrakesV                               = false
    siPayloadV                                  = false
    aglMslSegmentControl.selectedSegmentIndex   = 1
    dateAndTimePickerOutlet.date                = Date()
    for tf in section1TextFields {
        tf.text?.removeAll()
        section1TextFields[0].becomeFirstResponder()
    }
    for sw in section_1_Switches {
        sw.isOn = false
    }}
    
    func clearSection2() {
    lightingConditionsV     = "BLANK"
    icingConditionsV        = "BLANK"
    turbulanceV             = "BLANK"
    windsV                  = "BLANK"
    visibilityV             = "BLANK"
    for tf in section2TextFields {
        tf.text?.removeAll()
        section2TextFields[0].becomeFirstResponder()
    }}
    
    func clearSection3() {
    birdWatchCondV              = "BLANK"
    numberOfBirdsV              = "BLANK"
    wildLifeSizeV               = "BLANK"
    airCraftImpactV             = "BLANK"
    birdManDoingDutyV           = false
    sofAtcWarningV              = false
    aircraftLandingLightOnV     = false
    pilotWarningPriorToImpactV  = false
    for sw in section_3_Switches {
        sw.isOn = false
    }
    for tf in section3TextFields {
        tf.text?.removeAll()
        section3TextFields[0].becomeFirstResponder()
    }}
    
    func clearSection4() {
        incedentDescriptionTextViewOutlet.text  = "BLANK"
        checklistsRanTextViewOutlet.text        = "BLANK"
        feedBackTextViewOutlet.text             = "BLANK"
    }
    
    func clearSection5() {
        for sw in section_5_Switches {
            sw.isOn = false
        }
        emergencyDeclaredV  = false
        shutDownV           = false
        shutDownLocV        = "BLANK"
    }
    
    func resetAll() {
        clearSection5()
        clearSection4()
        clearSection3()
        clearSection2()
        clearSection1()
    }
    
    func updateIndicatorLabel(_ l: UILabel, with: Bool) {
        switch with {
        case true:
            l.text = "Y"
        case false:
            l.text = "N"
        }}
    
    func hideShutDownLocItems(_ tOrF: Bool) {
        shutDownLocTitleLabel.isHidden = !tOrF
        shutDownDropdown.isHidden = !tOrF
        if !tOrF {
            shutDownDropdown.text = " "
        }}
    
    func setTextFieldOrder(){
        section1TextFields = [lastName, firstName, middleName, rankDropDown, unitDropdown, phoneNumber, phaseOfFlightDropdown, heading, airspeed, altitude, callSign, aircraftTypeDropdown, tailNumber, sortieHrs, sortieDecHrs, location, non9RW]
        section2TextFields = [lightingDropdown,icingDropdown,turbulanceDropdown,winds,visibilityDropdown]
        section3TextFields = [birdConStepDropdown,birdConIncedentDropdown,numberOfBirdsDropdown,wildLifeSizeDropdown,aircraftImpactPts]
        section5TextFields = [shutDownDropdown]
    }
    
    func createNewIncedent() -> Incedent {
        let uuid = UUID()
        
        if incedentDescriptionTextViewOutlet.text != "" { self.descriptionFreeTextV = incedentDescriptionTextViewOutlet.text } else { self.descriptionFreeTextV = "BLANK" }
        if checklistsRanTextViewOutlet.text != "" { self.checklistsRanV = checklistsRanTextViewOutlet.text } else { self.checklistsRanV = "BLANK" }
        if feedBackTextViewOutlet.text != "" { self.feedBackV = feedBackTextViewOutlet.text } else { self.feedBackV = "BLANK" }
        
        let newIncedent = Incedent(uuidV: uuid, dateV: dateV, lastNameV: lastNameV, firstNameV: firstNameV, middleNameV: middleNameV, rankV: rankV, unitV: unitV, phoneNumberV: phoneNumberV, phaseOfFlightV: phaseOfFlightV, headingV: headingV, airspeedV: airspeedV, altitudeV: altitudeV, altTypeV: altTypeV, callSignV: callSignV, aircraftTypeV: aircraftTypeV, tailNumberV: tailNumberV, sortieDurationHrsV: sortieDurationHrsV, sortieDurationDecHrsV: sortieDurationDecHrsV,locationV: locationV, non9RWV: non9RWV, siElectricalV: siElectricalV, siFlightControlsV: siFlightControlsV, siHydraulicV: siHydraulicV, siEngineV: siEngineV, siFuelV: siFuelV, siInstrumentationV: siInstrumentationV, siEnviroPressureV: siEnviroPressureV, siGearBrakesV: siGearBrakesV, siPayloadV: siPayloadV, sect_1_OtherV: sect_1_OtherV, lightingConditionsV: lightingConditionsV, icingConditionsV: icingConditionsV, turbulanceV: turbulanceV, windsV: windsV, visibilityV: visibilityV, birdConStepV: birdConStepV, birdConIncedentV: birdConIncedentV, numberOfBirdsV: numberOfBirdsV, wildLifeSizeV: wildLifeSizeV, airCraftImpactV: airCraftImpactV, birdManDoingDutyV: birdManDoingDutyV, sofAtcWarningV: sofAtcWarningV, aircraftLandingLightOnV: aircraftLandingLightOnV, pilotWarningPriorToImpactV: pilotWarningPriorToImpactV, descriptionFreeTextV: descriptionFreeTextV, checklistsRanV: checklistsRanV, feedBackV: feedBackV, emergencyDeclaredV: emergencyDeclaredV, shutDownV: shutDownV, shutDownLocationV: shutDownLocV)
        
        print("************************************")
        let printable = Mirror(reflecting: newIncedent).children
        for child in printable {
            guard let lab = child.label else { return newIncedent}
            print("\(lab) : \(child.value)")
        }
        print("************************************")
        
        return newIncedent
    }
    
    
    // MARK: - AWS Shiza
    func runMutation(incedent: Incedent){
        let i = incedent
        let uniqueID = String(describing: i.uuidV)
        let date = String(describing: i.dateV)

        let mutationInput = CreateIncedentInput(uuid: uniqueID,
                                                date: date,
                                                lastName: i.lastNameV,
                                                firstName: i.firstNameV,
                                                middleName: i.middleNameV,
                                                rank: i.rankV,
                                                unit: i.unitV,
                                                phoneNumber: i.phoneNumberV,
                                                phaseOfFlight: i.phaseOfFlightV,
                                                heading: i.headingV,
                                                airspeed: i.airspeedV,
                                                altitude: i.altitudeV,
                                                altType: i.altTypeV,
                                                callSign: i.callSignV,
                                                aircraftType: i.aircraftTypeV,
                                                tailNumber: i.tailNumberV,
                                                sortieDurationHrs: i.sortieDurationHrsV,
                                                sortieDurationDecHrs: i.sortieDurationDecHrsV,
                                                location: i.locationV,
                                                non9Rw: i.non9RWV,
                                                siElectrical: i.siElectricalV,
                                                siFlightControls: i.siFlightControlsV,
                                                siHydraulic: i.siHydraulicV,
                                                siEngine: i.siEngineV,
                                                siFuel: i.siFuelV,
                                                siInstrumentation: i.siInstrumentationV,
                                                siEniroPressure: i.siEnviroPressureV,
                                                siGearBrakes: i.siGearBrakesV,
                                                siPayload: i.siPayloadV,
                                                sect_1Other: i.sect_1_OtherV,
                                                lightingConditions: i.lightingConditionsV,
                                                icingConditions: i.icingConditionsV,
                                                turbulance: i.turbulanceV,
                                                winds: i.windsV,
                                                isibility: i.visibilityV,
                                                birdConStep: i.birdConStepV,
                                                birdConIncedent: i.birdConIncedentV,
                                                numberOfBirds: i.numberOfBirdsV,
                                                wildLifeSize: i.wildLifeSizeV,
                                                airCraftImpact: i.airCraftImpactV,
                                                birdManDoingDuty: i.birdManDoingDutyV,
                                                sofAtcWarning: i.sofAtcWarningV,
                                                aircraftLandingLightOn: i.aircraftLandingLightOnV,
                                                pilotWarningPriorToImpact: i.pilotWarningPriorToImpactV,
                                                descriptionFreeText: i.descriptionFreeTextV,
                                                checklistsRan: i.checklistsRanV,
                                                feedBack: i.feedBackV,
                                                emergencyDeclared: i.emergencyDeclaredV,
                                                shutDown: i.shutDownV,
                                                shutDownLocation: i.shutDownLocationV)
        
        appSyncClient?.perform(mutation: CreateIncedentMutation(input: mutationInput)) { (result, error) in
            if let error = error as? AWSAppSyncClientError {
                print("Error occurred: \(error.localizedDescription )")
            }
            if let resultError = result?.errors {
                print("Error saving the item on server: \(resultError)")
                return
            }
            print("Mutation complete.")
        }}
    
    
    
    

    
}

    
