//
//  Request.swift
//  BoxOffice
//
//  Created by Hyuhng Min Kim on 2020/07/21.
//  Copyright © 2020 Hyuhng Min Kim. All rights reserved.
//

import Foundation

let DidReceiveFriendsNotification: Notification.Name = Notification.Name("DidReceiveFriends")

func requestFriends() {
    guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else { return }
    
    let session: URLSession = URLSession(configuration: .default)
    // closure: 서버에서 응답이 왔을 때 실행되는 코드
    let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else {return}
        
        do {
            let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
//            self.friends = apiResponse.results
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
            NotificationCenter.default.post(name: DidReceiveFriendsNotification, object: nil, userInfo: ["friends":apiResponse.results])
            
        } catch(let err) {
            print(err.localizedDescription)
        }
    }
    
    dataTask.resume()
}

var globalMovieInfo: [Movies] = []

let DidReceiveAllMoviesNotification: Notification.Name = Notification.Name("DidReceiveAllMovies")

func requestAllMovies(orderType: Int) {
    guard let url: URL = URL(string: "https://connect-boxoffice.run.goorm.io/movies?order_type=" + String(orderType)) else { return }
    
    let session: URLSession = URLSession(configuration: .default)
    let dataTask: URLSessionDataTask = session.dataTask(with: url) {
        (data: Data?, response: URLResponse?, error: Error?) in
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else { return }
        
        do {
            let apiResponse: MovieAPIResponse = try JSONDecoder().decode(MovieAPIResponse.self, from: data)
            NotificationCenter.default.post(name: DidReceiveAllMoviesNotification, object: nil, userInfo: ["movies":apiResponse.movieApiResults])
        } catch(let err) {
            print(err.localizedDescription)
        }
    }
    
    dataTask.resume()
}
