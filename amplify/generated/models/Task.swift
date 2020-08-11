// swiftlint:disable all
import Amplify
import Foundation

public struct Task: Model {
  public let id: String
  public var title: String
  public var completed: Bool
  
  public init(id: String = UUID().uuidString,
      title: String,
      completed: Bool) {
      self.id = id
      self.title = title
      self.completed = completed
  }
}