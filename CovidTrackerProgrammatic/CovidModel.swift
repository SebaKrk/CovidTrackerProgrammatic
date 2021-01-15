//
//  CovidModel.swift
//  CovidTrackerProgrammatic
//
//  Created by Sebastian Sciuba on 15/01/2021.
//

import Foundation

struct CovidModel:Codable {
    
    let country: String?
    let continent : String?
    let deaths: Int?
    let cases: Int?
    let active: Int?
    let tests: Int?
    let todayCases:Int?
    let recovered: Int?
    let countryInfo : CountryInfo?
    
    let population : Int?
    let todayDeaths : Int?
    let todayRecovered : Int?
    let critical : Int?
    let oneCasePerPeople : Int?
}

struct CountryInfo: Codable {
    let flag : String?
}
