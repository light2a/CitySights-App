//
//  BusinessModel.swift
//  CitySights App
//
//  Created by duc on 06/05/2024.
//

import Foundation
import SwiftUI

@Observable
class BusinessModel {
    var businesses = [Business]()
    var selectedBusiness: Business?
    var query: String = ""
    var service = DataService()
    
    func getBusiness() {
        Task {
            businesses = await service.businessSearch()
        }
    }
}
