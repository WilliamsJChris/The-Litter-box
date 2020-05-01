//
//  MapItemRow.swift
//  The Sand Box
//
//  Created by Christopher Williams on 4/30/20.
//  Copyright © 2020 ThunderCats. All rights reserved.
//

import SwiftUI

struct MapItemRow: View {
    var location: Location
    
    var body: some View {
        HStack {
            VStack{
                Image("map")
                Text(String(location.id))
                    .font(.subheadline)
            }
            Spacer()
            VStack{
                Text(location.gameType)
                    .font(.subheadline)
                HStack{
                    Text(location.address1 + ",")
                        .font(.subheadline)
                    Text(location.zip)
                        .font(.subheadline)
                }
                HStack{
                    Text(location.date)
                        .font(.subheadline)
                    Text(location.time)
                        .font(.subheadline)
                }
            }
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapItemRow(location: locationData[0])
            MapItemRow(location: locationData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
