//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by duc on 04/05/2024.
//

import SwiftUI

struct BusinessDetailView: View {
    var business: Business?
    var body: some View {
        Text(business?.name ?? "caa")
    }
}

#Preview {
    BusinessDetailView()
}
