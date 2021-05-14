//
//  RestaurantCell.swift
//  frestaurant
//
//  Created by Christianto Budisaputra on 14/05/21.
//

import UIKit

class RestaurantCell: UITableViewCell {

  @IBOutlet weak var restaurantImage: UIImageView!
  @IBOutlet weak var restaurantRating: UILabel!
  @IBOutlet weak var restaurantName: UILabel!
  @IBOutlet weak var restaurantLocation: UILabel!
  var restaurant: Restaurant?
  let axios = Axios.shared

  override func layoutSubviews() {
    if let restaurant = restaurant {
      restaurantName.text = restaurant.name
      restaurantLocation.text = restaurant.city
      restaurantRating.text = restaurant.rating.toRating()

      axios.fetch(URL.restaurantImage + restaurant.pictureID) { result in
        switch result {
        case .success(let data):
          self.restaurantImage.image = UIImage(data: data)
        case .failure(let err):
          print("Error:", err.localizedDescription)
        }
      }
    }
  }

}
