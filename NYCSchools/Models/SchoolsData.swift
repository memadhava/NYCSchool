//
//  SchoolsData.swift
//  NYCSchools
//
//  Created by Madhav Gadve on 7/2/25.
//


import Foundation


struct Schools: Codable {
    let dbn: String
    let school_name: String
    let overview_paragraph: String
    let location: String
    let academicopportunities1: String?
    let academicopportunities2: String?
    let extracurricular_activities: String?
    let school_email: String?
    let phone_number: String?
    let latitude: String?
    let longitude: String?
}
