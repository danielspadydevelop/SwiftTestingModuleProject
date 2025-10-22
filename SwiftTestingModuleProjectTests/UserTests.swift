//
//  UserTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/22/25.
//

@testable import SwiftTestingModuleProject
import Testing

@Test func outstandingTasksStringIsPlural() {
    // given
    var sut = User(name: "Drake")

    for album in 1...3 {
        var project = Project(name: "Album #\(album)")

        for song in 1...10 {
            let item = ToDoItem(name: "Write song #\(song)")
            project.addToDoItem(item)
        }

        sut.addProject(project)
    }

    // when
    let rowTitle = sut.outstandingTasksString

    // then
    #expect(rowTitle == "30 items")
}
