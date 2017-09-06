//
//  {{ cookiecutter.project_name | replace(' ', '') }}Tests.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}Tests
//
//  Created by {{ cookiecutter.lead_dev }} on 30/05/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import XCTest
@testable import {{ cookiecutter.project_name | replace(' ', '') }}

class {{ cookiecutter.project_name | replace(' ', '') }}Tests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
