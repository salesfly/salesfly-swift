// swift-tools-version:4.0
//
//  Package.swift
//  Swift client for Salesfly API 
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//
import PackageDescription

let package = Package(
    name: "Salesfly",
    products: [
        .library(
            name: "Salesfly",
            targets: ["Salesfly"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Salesfly"
        ),
        .testTarget(
            name: "SalesflyTests",
            dependencies: ["Salesfly"]),            
    ]
)