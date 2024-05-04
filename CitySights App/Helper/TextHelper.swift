//
//  TextHelper.swift
//  CitySights App
//
//  Created by duc on 04/05/2024.
//

import Foundation

struct TextHelper {
    static func distanceAwayText (meters: Double) -> String {// static la goi truc tiep luon neu ko phai tao text helper moi sai dc
        if meters > 1000 {
            return "\(Int(round(meters/1000)))m away"
        }
        return "\(Int(round(meters)))m away"
    }
}
