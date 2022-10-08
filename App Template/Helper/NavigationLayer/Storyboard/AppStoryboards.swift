//
//  AppStoryboards.swift
//  Cordinator Pattern Sample
//
//  Created by AliFayed on 08/10/2022.
//

import Foundation
import UIKit
protocol Storyboarded {
    static func instaintiate(on storyboard: AppStoryboards) -> Self
}
enum AppStoryboards: String {
    case main = "Main"
}
