//
//  MovieInfo.swift
//  BoxOffice
//
//  Created by Hyuhng Min Kim on 2020/07/22.
//  Copyright © 2020 Hyuhng Min Kim. All rights reserved.
//

import Foundation

struct MovieAPIResponse: Codable {
    let orderType: Int
    let movieApiResults: [Movies]
}

// information of every movie
struct Movies: Codable {
    let grade: Int
    let thumb: String
    let reservationGrade: Int
    let title: String
    let reservationRate: Double
    let userRating: Double
    let date: String
    let id: String
    
    var tableViewFull: String {
        return "평점 : " + String(format: "%.1f", self.userRating) + " 예매순위 : " + String(self.reservationGrade) + " 예매율 : " + String(format: ".2f", self.reservationRate)
    }
    
    var tableViewOpeningDate: String {
        return "개봉일 : " + self.date
    }
    
    var collectionViewFull: String {
        return String(self.reservationGrade) + "위(" + String(format: "%.1f", self.userRating) + ") / " + String(format: "%.2f", self.reservationRate) + "%"
    }
}

// information of individual movies
struct MovieInfo: Codable {
    let audience: Int
    let actor: String
    let duration: Int
    let director: String
    let synopsis: String
    let genre: String
    let grade: Int
    let image: String
    let reservationGrade: Int
    let title: String
    let reservationRate: Double
    let user_rating: Double
    let date: String
    let id: String
}

struct CommentsAPIResponse: Codable {
    let commentsApiResults: [Comments]
}

struct Comments: Codable {
    let rating: Double
    let timestamp: Double
    let writer: String
    let movieId: String
    let contents: String
    let id: String
}
