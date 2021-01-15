//
//  Service.swift
//  CovidTrackerProgrammatic
//
//  Created by Sebastian Sciuba on 15/01/2021.
//

import Foundation

struct Service {
    
    func getJason(completed: @escaping ([CovidModel]) -> ()) {
        let urlString = "https://disease.sh/v2/countries/"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            do {
                let decodeData = try JSONDecoder().decode([CovidModel].self, from: data)
                completed(decodeData)
            } catch {
                print("error masage: \(error)")
            }
        }
        task.resume()

    }
}
