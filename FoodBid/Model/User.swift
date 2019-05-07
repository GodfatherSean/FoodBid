import UIKit

class User {
  var name: String
  var avatarName: String
  var education: String
  
  init(name: String, avatarName: String = "bayMax", education: String) {
    self.name = name
    self.avatarName = avatarName
    self.education = education
  }
}
