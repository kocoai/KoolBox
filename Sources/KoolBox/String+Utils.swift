//
//  String+Utils.swift
//  ToolBox
//

public extension String {
  var trimmed: String {
    trimmingCharacters(in: .whitespacesAndNewlines)
  }
}
