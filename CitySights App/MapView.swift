//
//  MapView.swift
//  CitySights App
//
//  Created by duc on 06/05/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(BusinessModel.self) private var model
    @State var selectedId: String?
    var body: some View {
        Map(selection: $selectedId) {
            ForEach(model.businesses, id: \.id){ b in
                Marker(b.name ?? "Res", coordinate: CLLocationCoordinate2D(latitude: b.coordinates?.latitude ?? 0, longitude: b.coordinates?.longitude ?? 0))// toa do
                    .tag(b.id ?? "")// optional thi lo ma doi
            }
        }
        .onChange(of: selectedId) { oldValue, newValue in
            //find the business which matches this id
            let business = model.businesses.first { bu in
                bu.id == selectedId
                
            }
            // if the business is found, set it as the selected one
            if business != nil {
                model.selectedBusiness = business!
            }
        }
    }
}

#Preview {
    MapView().environment(BusinessModel())
}
