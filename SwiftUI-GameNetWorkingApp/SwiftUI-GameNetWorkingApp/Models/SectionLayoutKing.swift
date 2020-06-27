//
//  SectionLayoutKing.swift
//  SwiftUI-GameNetWorkingApp
//
//  Created by qjinliang on 2020/6/25.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

protocol SectionKind {
    var items:[Item] { get }
}

struct GenerSection: SectionKind {
    var items: [Item]
}

struct PlatfromSection: SectionKind {
    var items: [Item]
}


struct SortSection: SectionKind {
    var items: [Item]
}


struct GameSection: SectionKind {
    var items: [Item]
}

struct SectionLayoutKind : Hashable {

    
    var kind: SectionKind
    init(kind: SectionKind) {
        self.kind = kind
    }
    
    
    var identifiner: String {
        let identifiner: String
        switch kind {
        case is GenerSection:
            identifiner =  "genre"
        case is PlatfromSection:
            identifiner =  "platfrom"
        case is SortSection:
            identifiner =  "sort"
        case is GameSection:
            identifiner =  "game"
        default:
            identifiner = ""
        }
        return identifiner
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifiner)
    }
    
    static func == (lhs: SectionLayoutKind, rhs: SectionLayoutKind) -> Bool {
        lhs.identifiner == rhs.identifiner
    }
}

