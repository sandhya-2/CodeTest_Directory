//
//  Rooms.swift
//  DirectoryApp
//
//  Created by admin on 03/05/2022.
//

import Foundation

struct Rooms : Codable {
    let createdAt: String
    let isOccupied: Bool
    let maxOccupancy: Int
    let id: String
}
/*
 [{"createdAt":"2022-01-24T20:52:50.765Z","isOccupied":false,"maxOccupancy":53539,"id":"1"},{"createdAt":"2022-01-25T14:37:26.128Z","isOccupied":false,"maxOccupancy":34072,"id":"2"},{"createdAt":"2022-01-25T04:00:35.500Z","isOccupied":false,"maxOccupancy":75480,"id":"3"},{"createdAt":"2022-01-25T14:26:15.080Z","isOccupied":false,"maxOccupancy":44832,"id":"4"},{"createdAt":"2022-01-25T02:06:05.225Z","isOccupied":false,"maxOccupancy":1976,"id":"5"}
 
 */
