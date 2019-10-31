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
    var siElectricalV: Bool
    var siFlightControlsV: Bool
    var siHydraulicV: Bool
    var siEngineV: Bool
    var siFuelV: Bool
    var siInstrumentationV: Bool
    var siEnviroPressureV: Bool
    var siGearBrakesV: Bool
    var siPayloadV: Bool
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
    
    var birdManDoingDutyV: Bool
    var sofAtcWarningV: Bool
    var aircraftLandingLightOnV: Bool
    var pilotWarningPriorToImpactV: Bool
    
    var descriptionFreeTextV: String
    var checklistsRanV: String
    var feedBackV: String
    
//    var <#here#>: Bool
//    var <#here#>: Bool
    
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
         siElectricalV: Bool?,
         siFlightControlsV: Bool?,
         siHydraulicV: Bool?,
         siEngineV: Bool?,
         siFuelV: Bool?,
         siInstrumentationV: Bool?,
         siEnviroPressureV: Bool?,
         siGearBrakesV: Bool?,
         siPayloadV: Bool?,
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
         birdManDoingDutyV: Bool?,
         sofAtcWarningV: Bool?,
         aircraftLandingLightOnV: Bool?,
         pilotWarningPriorToImpactV: Bool?,
         descriptionFreeTextV: String?,
         checklistsRanV: String?,
         feedBackV: String?) {
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
        self.siElectricalV = siElectricalV ?? false
        self.siFlightControlsV = siFlightControlsV ?? false
        self.siHydraulicV = siHydraulicV ?? false
        self.siEngineV = siEngineV ?? false
        self.siFuelV = siFuelV ?? false
        self.siInstrumentationV = siInstrumentationV ?? false
        self.siEnviroPressureV = siEnviroPressureV ?? false
        self.siGearBrakesV = siGearBrakesV ?? false
        self.siPayloadV = siPayloadV ?? false
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
        self.birdManDoingDutyV = birdManDoingDutyV ?? false
        self.sofAtcWarningV = sofAtcWarningV ?? false
        self.aircraftLandingLightOnV = aircraftLandingLightOnV ?? false
        self.pilotWarningPriorToImpactV = pilotWarningPriorToImpactV ?? false
        self.descriptionFreeTextV = descriptionFreeTextV ?? ""
        self.checklistsRanV = checklistsRanV ?? ""
        self.feedBackV = feedBackV ?? ""
    }
    
}


//class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
class ViewController: UIViewController, UITextFieldDelegate {
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
    
    var siElectricalV               = false
    var siFlightControlsV           = false
    var siHydraulicV                = false
    var siEngineV                   = false
    var siFuelV                     = false
    var siInstrumentationV          = false
    var siEnviroPressureV           = false
    var siGearBrakesV               = false
    var siPayloadV                  = false
    
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
    
    var descriptionFreeTextV        = ""
    var checklistsRanV              = ""
    var feedBackV                   = ""
    var emergencyDeclaredV          = false { didSet {
        updateIndicatorLabel(emergencyYNLabel, with: emergencyDeclaredV)
        }}
    var shutDownV                   = false { didSet {
        updateIndicatorLabel(shutDownYNLabel, with: shutDownV)
        hideShutDownLocItems(shutDownV)
        }}
    var shutDownLocV                = ""
    
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
        
        siElectricalV = false
        siFlightControlsV = false
        siHydraulicV = false
        siEngineV = false
        siFuelV = false
        siInstrumentationV = false
        siEnviroPressureV = false
        siGearBrakesV = false
        siPayloadV = false
        
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
        lightingConditionsV     = ""
        icingConditionsV        = ""
        turbulanceV             = ""
        windsV                  = ""
        visibilityV             = ""
        for tf in section2TextFields {
            tf.text?.removeAll()
            section2TextFields[0].becomeFirstResponder()
        }}
    
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
    
    func clearSection3() {
        birdWatchCondV              = ""
        numberOfBirdsV              = ""
        wildLifeSizeV               = ""
        airCraftImpactV             = ""
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
    

    // MARK: - SECTION IV.  NARRATIVE COMMENTS
    @IBOutlet weak var incedentDescriptionTextViewOutlet: UITextView!
    @IBOutlet weak var checklistsRanTextViewOutlet: UITextView!
    @IBOutlet weak var feedBackTextViewOutlet: UITextView!
    
    @IBOutlet weak var clearSect_4Outlet: UIButton!
    @IBAction func clearSect_4(_ sender: UIButton) {
        clearSect_4Outlet.showPressed()
        clearSection4()
    }
    
    func clearSection4() {
        incedentDescriptionTextViewOutlet.text = ""
        checklistsRanTextViewOutlet.text = ""
        feedBackTextViewOutlet.text = ""
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
    @IBAction func clearSection5(_ sender: UIButton) {
        clearSection5Outlet.showPressed()
        clearSection5()
    }
    
    
    
    func clearSection5() {
        emergencyDeclaredV = false
        shutDownV = false
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

    
    // MARK: - BOTTOM
    @IBOutlet weak var submitFormButtonOutlet: UIButton!
    @IBAction func submitFormButton(_ sender: UIButton) {
        submitFormButtonOutlet.showPressed()
        submitForm()
    }
    
    func submitForm() {
        let uuid = UUID()
        self.descriptionFreeTextV = incedentDescriptionTextViewOutlet.text
        self.checklistsRanV = checklistsRanTextViewOutlet.text
        self.feedBackV = feedBackTextViewOutlet.text
        let newIncedent = Incedent(uuidV: uuid, dateV: dateV, lastNameV: lastNameV, firstNameV: firstNameV, middleNameV: middleNameV, rankV: rankV, unitV: unitV, phoneNumberV: phoneNumberV, phaseOfFlightV: phaseOfFlightV, headingV: headingV, airspeedV: airspeedV, altitudeV: altitudeV, altTypeV: altTypeV, callSignV: callSignV, aircraftTypeV: aircraftTypeV, tailNumberV: tailNumberV, sortieDurationHrsV: sortieDurationHrsV, sortieDurationDecHrsV: sortieDurationDecHrsV,locationV: locationV, non9RWV: non9RWV, siElectricalV: siElectricalV, siFlightControlsV: siFlightControlsV, siHydraulicV: siHydraulicV, siEngineV: siEngineV, siFuelV: siFuelV, siInstrumentationV: siInstrumentationV, siEnviroPressureV: siEnviroPressureV, siGearBrakesV: siGearBrakesV, siPayloadV: siPayloadV, sect_1_OtherV: sect_1_OtherV, lightingConditionsV: lightingConditionsV, icingConditionsV: icingConditionsV, turbulanceV: turbulanceV, windsV: windsV, visibilityV: visibilityV, birdConStepV: birdConStepV, birdConIncedentV: birdConIncedentV, numberOfBirdsV: numberOfBirdsV, wildLifeSizeV: wildLifeSizeV, airCraftImpactV: airCraftImpactV, birdManDoingDutyV: birdManDoingDutyV, sofAtcWarningV: sofAtcWarningV, aircraftLandingLightOnV: aircraftLandingLightOnV, pilotWarningPriorToImpactV: pilotWarningPriorToImpactV, descriptionFreeTextV: descriptionFreeTextV, checklistsRanV: checklistsRanV, feedBackV: feedBackV)
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
//        print(scrollView.contentOffset)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset)
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
            tf.backgroundColor = .darkGray
        }}
    
    
    
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
        shutDownDropdown.selectionItems         = dd.shutDownLoc
    }
    
}

    
