//
//  ViewController.swift
//  MovieViewer
//
//  Created by Tejen Hasmukh Patel on 6/4/17.
//  Copyright © 2017 tejen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    var movies: [NSDictionary]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)"
        
        let urlString = URL(string: url)
        if let url = urlString {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error)
            } else {
                if let usableData = data {
                    print(usableData) //JSONSerialization
                    do {
                        let parsedData = try JSONSerialization.jsonObject(with: usableData) as! [String: Any]
                        self.movies = parsedData["results"] as! [NSDictionary]
                    } catch let error as NSError {
                    }
                }
            }
        }
        task.resume()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if moviesDictionaries = movies {
            return moviesDictionaries.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        cell.movie = movies[indexPath.row]
        return cell
    }

}

