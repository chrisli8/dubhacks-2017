import Foundation

public struct User {

  public var title: String
  public var creator: String
  public var description: String
  public var headcount: Int

  init(email: String, creator: String, description: String, headcount: Int) {
    self.email = email
    self.creator = creator
    self.description = description
    self.headcount = headcount
  }

  public func getEmail() -> String {
    return self.email
  }

  public func getcreator() -> String {
    return self.Creator
  }

  public func getDescription() -> String {
    return self.description
  }

  public func getHeadcount() -> Int {
    return self.headcount
  }

  public func toAnyObject() -> {
    return [
      "email": self.email,
      "creator": self.creator,
      "description": self.description,
      "headcount": self.headcount
    ]
  }
}
