//
//  Model.swift
//  DirectoryApp
//
//  Created by admin on 03/05/2022.
//

import Foundation

struct People: Codable {
    let createdAt, firstName: String
    let avatar: String
    let lastName, email, jobtitle, favouriteColor: String
    let id: String
    let data: DataClass?
    let to, fromName: String?
}

struct DataClass: Codable {
    let title, body, id, toID: String
    let fromID, meetingid: String
    
    enum CodingKeys: String, CodingKey {
        case title, body, id
        case toID = "toId"
        case fromID = "fromId"
        case meetingid
    }
}

/*
 [{"createdAt":"2022-01-24T17:02:23.729Z","firstName":"Maggie","avatar":"https://randomuser.me/api/portraits/women/21.jpg","lastName":"Brekke","email":"Crystel.Nicolas61@hotmail.com","jobtitle":"Future Functionality Strategist","favouriteColor":"pink","id":"1"},{"createdAt":"2022-01-24T22:47:43.227Z","firstName":"Armando","avatar":"https://randomuser.me/api/portraits/women/23.jpg","lastName":"Weber","email":"Milton.Wisoky@gmail.com","jobtitle":"Principal Accounts Developer","favouriteColor":"sky blue","id":"2"},{"createdAt":"2022-01-25T02:27:00.553Z","firstName":"Ceasar","avatar":"https://randomuser.me/api/portraits/women/4.jpg","lastName":"Turner","email":"Hettie31@gmail.com","jobtitle":"Future Interactions Supervisor","favouriteColor":"cyan","id":"3"},
 */
