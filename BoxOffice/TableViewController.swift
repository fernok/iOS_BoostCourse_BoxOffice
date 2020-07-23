//
//  TableViewController.swift
//  BoxOffice
//
//  Created by Hyuhng Min Kim on 2020/07/22.
//  Copyright © 2020 Hyuhng Min Kim. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var settingsButton: UIBarButtonItem!
    let cellIdentifier: String = "movieTableViewCell"
    var movies: [Movies] = []
    
    @IBAction func touchUpSettingsButton(_ sender: UIBarButtonItem) {
        selectOrderingStyle(controller: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return globalMovieInfo.count
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MovieTableViewCell
        
        let movie: Movies = self.movies[indexPath.row]
        
        cell.movieTitleLabel?.text = movie.title
        cell.movieInfoLabel?.text = movie.tableViewFull
        cell.movieOpeningDateLabel?.text = movie.tableViewOpeningDate
        cell.posterImageView?.image = nil
        
        cell.movieTitleLabel?.text = "TITLE"
        
        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: movie.thumb) else { return }
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                if let index: IndexPath = tableView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.posterImageView?.image = UIImage(data: imageData)
                    }
                }
            }
        }
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//         Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.topItem?.title = "예매율"
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceieveMoviesNotification(_:)), name: DidReceiveAllMoviesNotification, object: nil)
    }
    
    @objc func didReceieveMoviesNotification(_ noti: Notification) {
        guard let movies: [Movies] = noti.userInfo?["movies"] as? [Movies] else { return }
        
        self.movies = movies
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        requestAllMovies(orderType: 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
