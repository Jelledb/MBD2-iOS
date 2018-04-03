//
//  ViewController.swift
//  Eindopdracht-MBD2
//
//  Created by Jelle den Burger on 29-03-18.
//  Copyright © 2018 Jelle den Burger. All rights reserved.
//

import UIKit

class TvShowListViewController: ColorUIViewController, UITableViewDataSource, UITableViewDelegate {
    var tvShows = [] as Array<TvShow>
    var taskRunning: Bool = false;
    var task: URLSessionTask? = nil;
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TV Series";
        
        tableView.dataSource = self;
        tableView.delegate = self;
        // self.tableView.backgroundColor = uiColor;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textDidChange(_ sender: UITextField) {
        search(sender.text!);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TvShowCell")!
        cell.textLabel?.text = tvShows[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : TvShowDetailViewController = mainStoryboard.instantiateViewController(withIdentifier: "TvShowDetailViewController") as! TvShowDetailViewController
        vc.tvShow  = self.tvShows[indexPath.row]
        self.show(vc, sender: self);
    }
    
    func search(_ query: String) {
        if (query.count >= 3) {
            let encodedStr = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            let url = URL(string: "https://api.tvmaze.com/search/shows?q=" + encodedStr!)!
            
            if (taskRunning) {
                Swift.print("Kapot")
                task!.cancel();
            }
            
            taskRunning = true;
            task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let receivedData = data {
                    
                    do {
                        // Optie 1: Gebruik JSONSerialization
                        
                        let json = try JSONSerialization.jsonObject(with: receivedData) as! Array<[String:Any]>
                        
                        self.tvShows = [];
                        
                        Swift.print("blablabla \(json.count)")
                        
                        for obj in json {
                            self.tvShows.append(TvShow(json: obj["show"]! as! [String : Any]));
                        }
    //                    let main = json["main"] as! [String:Any]
    //                    let kelvin_temperature = main["temp"] as! Double
                        self.taskRunning = false;
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch { }
                }
            }
            task!.resume()
        } else if (query.count <= 0){
            self.tvShows = [];
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            return;
        }
    }
}

