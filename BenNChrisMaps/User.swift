import Foundation

public struct User {

  public var email: String
  public var name: String
  public var pic: String

  init(email: String, name: String, pic: String) {
    self.email = email
    self.name = name
    self.pic = pic
  }

  public func getEmail() -> String {
    return self.email
  }

  public func getName() -> String {
    return self.name
  }

  public func getPic() -> String {
    return self.pic
  }

  public func toAnyObject() -> {
    return [
      "email": self.email,
      "name": self.name,
      "pic": self.pic
    ]
  }
}
