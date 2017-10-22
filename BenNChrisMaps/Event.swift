import Foundation

public struct User {

  public var title: String
  public var creator: String
  public var description: String
  public var headcount: Int
  private var tags: [String]

  init(email: String, creator: String, description: String, headcount: Int, tags: [String]) {
    self.email = email
    self.creator = creator
    self.description = description
    self.headcount = headcount
    self.tags = tags
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

  public func getTags() -> [String] {
    return self.tags
  }

  public func toAnyObject() -> {
    var tagString = nil
    for tag in tags {
      tagString += "\"tag\": " + tag + ", "
    }
    return [
      "email": self.email,
      "creator": self.creator,
      "description": self.description,
      "headcount": self.headcount,
      "tags":
    ]
  }
}
