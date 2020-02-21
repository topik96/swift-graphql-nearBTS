// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetNearBtsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getNearBTS($distance: Int, $lat: float8, $long: float8, $limit: Int) {
      search_tower_near_user(args: {distance_kms: $distance, lat: $lat, long: $long}, limit: $limit) {
        __typename
        entity_id
        filenum
        issue_date
        latitude
        longitude
        regnum
      }
    }
    """

  public let operationName: String = "getNearBTS"

  public var distance: Int?
  public var lat: String?
  public var long: String?
  public var limit: Int?

  public init(distance: Int? = nil, lat: String? = nil, long: String? = nil, limit: Int? = nil) {
    self.distance = distance
    self.lat = lat
    self.long = long
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["distance": distance, "lat": lat, "long": long, "limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search_tower_near_user", arguments: ["args": ["distance_kms": GraphQLVariable("distance"), "lat": GraphQLVariable("lat"), "long": GraphQLVariable("long")], "limit": GraphQLVariable("limit")], type: .nonNull(.list(.nonNull(.object(SearchTowerNearUser.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(searchTowerNearUser: [SearchTowerNearUser]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "search_tower_near_user": searchTowerNearUser.map { (value: SearchTowerNearUser) -> ResultMap in value.resultMap }])
    }

    /// execute function "search_tower_near_user" which returns "location_tower"
    public var searchTowerNearUser: [SearchTowerNearUser] {
      get {
        return (resultMap["search_tower_near_user"] as! [ResultMap]).map { (value: ResultMap) -> SearchTowerNearUser in SearchTowerNearUser(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: SearchTowerNearUser) -> ResultMap in value.resultMap }, forKey: "search_tower_near_user")
      }
    }

    public struct SearchTowerNearUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["location_tower"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("entity_id", type: .scalar(Int.self)),
        GraphQLField("filenum", type: .scalar(String.self)),
        GraphQLField("issue_date", type: .scalar(String.self)),
        GraphQLField("latitude", type: .nonNull(.scalar(Double.self))),
        GraphQLField("longitude", type: .nonNull(.scalar(Double.self))),
        GraphQLField("regnum", type: .nonNull(.scalar(Int.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(entityId: Int? = nil, filenum: String? = nil, issueDate: String? = nil, latitude: String, longitude: String, regnum: Int) {
        self.init(unsafeResultMap: ["__typename": "location_tower", "entity_id": entityId, "filenum": filenum, "issue_date": issueDate, "latitude": latitude, "longitude": longitude, "regnum": regnum])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var entityId: Int? {
        get {
          return resultMap["entity_id"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "entity_id")
        }
      }

      public var filenum: String? {
        get {
          return resultMap["filenum"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "filenum")
        }
      }

      public var issueDate: String? {
        get {
          return resultMap["issue_date"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "issue_date")
        }
      }

      public var latitude: Double {
        get {
          return resultMap["latitude"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "latitude")
        }
      }

      public var longitude: Double {
        get {
          return resultMap["longitude"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "longitude")
        }
      }

      public var regnum: Int {
        get {
          return resultMap["regnum"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "regnum")
        }
      }
    }
  }
}
