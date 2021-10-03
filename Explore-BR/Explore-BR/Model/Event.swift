//
//  Event.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 29/09/21.
//

import Foundation
import UIKit

struct Event {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
    let dateStart: Date
    let dateEnd: Date
    let description: String
    let imageUrl: String
}

let event01: Event = Event(id: "1", name: "Festa de Natal", latitude: -30.0654496, longitude: -51.2380487, dateStart: Date(), dateEnd: Date(), description: "Festa na noite de Natal", imageUrl: "https://static-wp-tor15-prd.torcedores.com/wp-content/uploads/2020/06/0.jpg")
