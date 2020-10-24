//
//  UserDataSet.swift
//  Hona
//
//  Created by ghanima on 10/23/20.
//  Copyright © 2020 ghanima. All rights reserved.
//

import Foundation


var pics : [Pic] = [
.init(name: "profile1"),
 .init(name: "profile2")
]

var bgs : [Background] = [
.init(name: "bg1"),
    .init(name: "bg2")
]

var songs : [Song] = [
.init(name: "song1", nameSong: "nameSong1", image: "imgSong1"),
    .init(name: "song2", nameSong: "nameSong2", image: "imgSong2")
]

var emojis: [Emoji] = [
    .init(name: "emoji1", image: "emj_img1", num: 2,date:"2020/11/10"),
    .init(name: "emoji2", image: "emj_img2", num: 4,date:"2020/11/11")
]

var countries : [Country] = [
.init(name: "Kuwait"),
    .init(name: "Korea")
]

var users : [User] = [
.init(username: "ghanima", password: "123", profile_pic: pics[0] , profile_background: bgs[0], song: songs[0], user_emoji: [emojis[0]], country: countries[0]),
.init(username: "Kazumi", password: "123", profile_pic: pics[1] , profile_background: bgs[1], song: songs[1], user_emoji: [emojis[1]], country: countries[1]),
]
