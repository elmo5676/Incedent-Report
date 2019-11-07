//
//  ConfirmationWBViewController.swift
//  Incedent Report
//
//  Created by Matthew Elmore on 11/6/19.
//  Copyright © 2019 Matthew Elmore. All rights reserved.
//


import UIKit
import AWSAppSync

class ConfirmationWBViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incedentDic = setDic()
        initialSetup()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
    }
    
    @IBOutlet weak var confirmationTable: UITableView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var cancelButtonOutlet: UIButton!
    @IBOutlet weak var submitButtonOutlet: UIButton!
    @IBOutlet weak var backgroundBlur: UIVisualEffectView!
    var appSyncClient: AWSAppSyncClient?
    var incedent: Incedent?
    var incedentDic: [String : String] = [:]
    
    let headers = ["SECTION I.  SORTIE INFORMATION/MISHAP DETAILS","SECTION II.  WEATHER CONDITIONS","SECTION III.  FOR BIRD/WILDLIFE STRIKES","SECTION IV.  NARRATIVE COMMENTS","SECTION V.  MISCELLANEOUS"]
    var section_1_Labels = ["Date:","Name / Rank:","Email", "Unit:","Phone Number:","Phase of Flight:","Heading:","Airspeed:","Altitude:","Callsign:","Aircraft Type:","Tail Number:","Sortie Duration:","Location:","Non 9 RW Aircrew:","Systems Involved:","Other:"]
    var section_2_Labels = ["Lighting Conditions:","Icing Conditions:","Turbulance:","Winds:","Visibility:"]
    var section_3_Labels = ["Bird Condition at Step:","Bird Condition at Time of Incedent:","Wildlife Size:","Number of Birds:","Impact Points:","Birdman Performing Duties:","SOF/ATC Warning of Bird Hazard:","Aircraft Landing Light On:","Pilot Warning Prior to Impact:"]
    var section_4_Labels = ["Description of Incedent:","Checklists Performed:","Feedback:"]
    var section_5_Labels = ["Emergency Declared:","Engine Shutdown:","Shutdown Location:"]
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "incedentCell") as! IncedentCell
        let section = indexPath.section
        let key = returnCellTitle(section: section, index: indexPath.row)
        cell.titleLabel.text = key
        cell.contentLabel.adjustsFontSizeToFitWidth = true
        cell.contentLabel.text = incedentDic[key]
        return cell
    }
    
    func alertPopUp(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(.init(title: "OK", style: .default, handler: { (UIAlertAction) in
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }))
        self.present(alertController, animated: true)
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        submitButtonOutlet.showPressed()
        if let incedent = incedent {
            runMutation(incedent: incedent)
        }
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        cancelButtonOutlet.showPressed()
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return returnNumberOfRosInSection(section: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    
    
    func returnNumberOfRosInSection(section: Int) -> Int {
        let titles = [section_1_Labels, section_2_Labels, section_3_Labels, section_4_Labels, section_5_Labels]
        return titles[section].count
    }
    
    func returnCellTitle(section: Int, index: Int) -> String {
        let titles = [section_1_Labels, section_2_Labels, section_3_Labels, section_4_Labels, section_5_Labels]
        return titles[section][index]
    }
    
    
    
    func convertBool(_ bool: Bool) -> String {
        switch bool {
        case true:
            return "Yes"
        case false:
            return "No"
        }}
    
    func adjustTitleArrarys(_ titleArray: [String], lookUpDic: [String: String]) -> [String] {
        var resultArray = titleArray
        for title in titleArray {
            let i = resultArray.firstIndex(of: title)
            if lookUpDic[title]!.contains(placeHolderText) {
                resultArray.remove(at: i!)
            }
        }
        return resultArray
    }
    
    func initialSetup() {
        let cr: CGFloat = 10
        let bc: CGColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        let bw: CGFloat = 0.5
        
        //        mainView.layer.cornerRadius = cr
        //        mainView.layer.borderColor = bc
        //        mainView.layer.borderWidth = bw
        
        cancelButtonOutlet.layer.cornerRadius = cr
        cancelButtonOutlet.layer.borderColor = bc
        cancelButtonOutlet.layer.borderWidth = bw
        
        submitButtonOutlet.layer.cornerRadius = cr
        submitButtonOutlet.layer.borderColor = bc
        submitButtonOutlet.layer.borderWidth = bw
        
        backgroundBlur.layer.cornerRadius = cr
        backgroundBlur.layer.borderColor = bc
        backgroundBlur.layer.borderWidth = bw
        
        confirmationTable.layer.cornerRadius = cr
        confirmationTable.layer.borderColor = bc
        confirmationTable.layer.borderWidth = bw
        
    }
    
    func setDic() -> [String : String]{
        guard let i = incedent else {return [:]}
        var resultDic: [String: String] = [:]
        
        let systemsInvolved = ["Electrical" : i.siElectricalV,
                               "Flight Controls" : i.siFlightControlsV,
                               "Hydraulics" : i.siHydraulicV,
                               "Engine" : i.siEngineV,
                               "Fuel" : i.siFuelV,
                               "Inst" : i.siInstrumentationV,
                               "Enviro/Pressure" : i.siEnviroPressureV,
                               "Gear/Breaks" : i.siGearBrakesV,
                               "Payload" : i.siPayloadV]
        let si: String = {
            var result = ""
            for (key, value) in systemsInvolved {
                if value != false {
                    result += "\(key), "
                }}
            if result == "" { result = "BLANK" }
            return result
        }()
        
        resultDic = [section_1_Labels[0]: String(describing:i.dateV),
                     section_1_Labels[1]: "\(i.nameV) / \(i.rankV)",
            section_1_Labels[2]: i.emailV,
            section_1_Labels[3]: i.unitV,
            section_1_Labels[4]: i.phoneNumberV,
            section_1_Labels[5]: i.phaseOfFlightV,
            section_1_Labels[6]: "\(i.headingV)°",
            section_1_Labels[7]: "\(i.airspeedV) KTS",
            section_1_Labels[8]: "\(i.altitudeV) \(i.altTypeV)",
            section_1_Labels[9]: i.callSignV,
            section_1_Labels[10]: i.aircraftTypeV,
            section_1_Labels[11]: i.tailNumberV,
            section_1_Labels[12]: "\(i.sortieDurationHrsV).\(i.sortieDurationDecHrsV) HRS",
            section_1_Labels[13]: i.locationV,
            section_1_Labels[14]: i.non9RWV,
            section_1_Labels[15]: si,
            section_1_Labels[16]: i.sect_1_OtherV,
            
            section_2_Labels[0]: i.lightingConditionsV,
            section_2_Labels[1]: i.icingConditionsV,
            section_2_Labels[2]: i.turbulanceV,
            section_2_Labels[3]: i.windsV,
            section_2_Labels[4]: i.visibilityV,
            
            section_3_Labels[0]: i.birdConStepV,
            section_3_Labels[1]: i.birdConIncedentV,
            section_3_Labels[2]: i.wildLifeSizeV,
            section_3_Labels[3]: i.numberOfBirdsV,
            section_3_Labels[4]: i.airCraftImpactV,
            section_3_Labels[5]: convertBool(i.birdManDoingDutyV),
            section_3_Labels[6]: convertBool(i.sofAtcWarningV),
            section_3_Labels[7]: convertBool(i.aircraftLandingLightOnV),
            section_3_Labels[8]: convertBool(i.pilotWarningPriorToImpactV),
            
            section_4_Labels[0]: i.descriptionFreeTextV,
            section_4_Labels[1]: i.checklistsRanV,
            section_4_Labels[2]: i.feedBackV,
            section_5_Labels[0]: convertBool(i.emergencyDeclaredV),
            section_5_Labels[1]: convertBool(i.shutDownV),
            section_5_Labels[2]: i.shutDownLocationV]
        
        section_1_Labels = adjustTitleArrarys(section_1_Labels, lookUpDic: resultDic)
        section_2_Labels = adjustTitleArrarys(section_2_Labels, lookUpDic: resultDic)
        section_3_Labels = adjustTitleArrarys(section_3_Labels, lookUpDic: resultDic)
        section_4_Labels = adjustTitleArrarys(section_4_Labels, lookUpDic: resultDic)
        section_5_Labels = adjustTitleArrarys(section_5_Labels, lookUpDic: resultDic)
        
        
        return resultDic
    }
    
    // MARK: - AWS Shiza
    func runMutation(incedent: Incedent){
        let i = incedent
        let uniqueID = String(describing: i.uuidV)
        let date = String(describing: i.dateV)
        
        let mutationInput = CreateIncedentInput(uuid: uniqueID,
                                                date: date,
                                                name: i.nameV,
                                                rank: i.rankV,
                                                email: i.emailV,
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
                                                visibility: i.visibilityV,
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
                self.alertPopUp(title: "❗️❗️❗️❗️", message: "OOPS, Something went wrong, make sure you are connected to the internet and try again.")
                print("Error occurred: \(error.localizedDescription )")
            }
            if let resultError = result?.errors {
                print("Error saving the item on server: \(resultError)")
                self.alertPopUp(title: "❗️❗️❗️❗️", message: "One or more values were invalid")
                return
            }
            print("Mutation complete.")
            self.alertPopUp(title: "💥🦅💥", message: "Go relax and have a beer. Good job")
        }
    }
    
    
}


