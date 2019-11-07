//
//  Incedent.swift
//  Incedent Report
//
//  Created by Matthew Elmore on 10/31/19.
//  Copyright © 2019 Matthew Elmore. All rights reserved.
//

import UIKit


struct Incedent {
    var uuidV: UUID
    var dateV: Date
    var nameV: String
    var rankV: String
    var emailV: String
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
    var emergencyDeclaredV: Bool
    var shutDownV: Bool
    var shutDownLocationV: String
    
    init(uuidV: UUID,
        dateV: Date?,
         nameV: String?,
         rankV: String?,
         emailV: String?,
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
         feedBackV: String?,
         emergencyDeclaredV: Bool?,
         shutDownV: Bool?,
         shutDownLocationV: String?) {
        self.uuidV = uuidV
        self.dateV = dateV ?? Date()
        self.nameV = nameV ?? ""
        self.rankV = rankV ?? ""
        self.emailV = emailV ?? ""
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
        self.emergencyDeclaredV = emergencyDeclaredV ?? false
        self.shutDownV = shutDownV ?? false
        self.shutDownLocationV = shutDownLocationV ?? ""
    }
}



