//
//  VIewController + Extension.swift
//  weather_demo
//
//  Created by Yegor on 13.07.2020.
//  Copyright © 2020 Yegor Shcherbakha. All rights reserved.
//

import UIKit

extension ViewController {
    
    func presentAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { textField in
            let cities = ["Kiyv", "San Franisco"]
            textField.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                print("Search info for the \(cityName)")
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(search)
        ac.addAction(cancel)
        
        present(ac, animated: true, completion: nil)
        
    }
    
    
}
