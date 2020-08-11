// swiftlint:disable all
import Amplify
import Foundation

extension Task {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case completed
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let task = Task.keys
    
    model.pluralName = "Tasks"
    
    model.fields(
      .id(),
      .field(task.title, is: .required, ofType: .string),
      .field(task.completed, is: .required, ofType: .bool)
    )
    }
}