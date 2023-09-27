//
//  CustomError.swift
//  Badminton_Management
//
//  Created by Stephen003 on 2023/9/27.
//

import Foundation

enum CustomError: Error {
    case networkError(_: Error)
    case parseError(_: Error)
    case invalidData(_: Data)
    case emptyData
}
