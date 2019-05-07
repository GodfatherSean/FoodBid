import Foundation
import UIKit

import UIKit

var dishes = [Dish(id: "1", image: "dish-1", title: "Dish 1", price: 5.0),
          Dish(id: "2", image: "dish-2", title: "Dish 2", price: 6.0),
          Dish(id: "3", image: "dish-3", title: "Dish 3", price: 7.0),
          Dish(id: "4", image: "dish-4", title: "Dish 4", price: 8.0)]

class RestaurantViewController: UIViewController {
    
    
    var restaurant: Restaurant!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
//        tableView.delegate = self
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print(dishes)
    }
    
    func setCellWithDish(_ cell: UITableViewCell, dish: Dish) {
        let imageView: UIImageView = cell.viewWithTag(11) as! UIImageView
        let titleLabel: UILabel = cell.viewWithTag(12) as! UILabel
        let priceLabel: UILabel = cell.viewWithTag(13) as! UILabel
        
        imageView.image = UIImage(named: dish.image)
        titleLabel.text = dish.title
        priceLabel.text = "original: \(dish.originalPrice), now: \(dish.price)"
    }
}

extension RestaurantViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dish = dishes[(indexPath as NSIndexPath).row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DishCell", for: indexPath) as? DishCell {
            cell.featureImageView.image = UIImage(named: dish.image)
            cell.titleLabel.text = dish.title
            cell.priceLabel.text = "original: \(dish.originalPrice), now: \(dish.price)"
            return cell
        }
        return UITableViewCell()
    }
}
