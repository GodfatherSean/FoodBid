import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - public API
    var restaurant: Restaurant! {
        didSet {
            updateUI()
        }
    }
    
    func loadImage() {
        guard let url = URL(string: restaurant.photoUrl) else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if error == nil {
                guard let data = data else {return}
                let img = UIImage.init(data: data)
                DispatchQueue.main.async {
                    self.featuredImageView.image = img
                }
            } else {
                print(error)
            }
        })
        task.resume()
    }
    
    fileprivate func updateUI() {
        titleLabel.text = self.restaurant.name
        self.loadImage()
    }
    
    // MARK: - refactor layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
    }
}
