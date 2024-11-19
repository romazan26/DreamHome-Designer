//
//  PageIntroModel.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import Foundation

struct PageIntro: Identifiable,Equatable {
    let id = UUID()
    var imageUrl: String
    var text: String
    var text2: String
    var tag: Int

    static var samplePage = PageIntro(imageUrl: "intro1", text: "Your dream home starts here", text2: "Add your exterior and interior designs, upload photos and write notes.", tag: 0)
    
    static var sampalePages: [PageIntro] = [
        PageIntro(imageUrl: "intro1", text: "Your dream home starts here", text2: "Add your exterior and interior designs, upload photos and write notes.", tag: 0),
        PageIntro(imageUrl: "intro2", text: "Save and access anytime", text2: "Your projects are always within reach and available offline. Start creating now!", tag: 1),
    ]
}
