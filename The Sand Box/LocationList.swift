//
//  LocationList.swift
//  The Sand Box
//
//  Created by Christopher Williams on 4/30/20.
//  Copyright © 2020 ThunderCats. All rights reserved.
//

import SwiftUI

struct LocationList: View {
    var body: some View {
        List {
            MapItemRow(location: locationData[0])
            MapItemRow(location: locationData[1])
        }
    }
}

struct LocationList_Previews: PreviewProvider {
    static var previews: some View {
        LocationList()
    }
}
