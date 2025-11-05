//
//  UserTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/22/25.
//

@testable import SwiftTestingModuleProject
import Testing

func createTestUser(projects: Int, itemsPerProject: Int) throws -> User {
    var user = User(name: "Drake")
    try #require(user.projects.isEmpty)

    for album in 1...projects {
        var project = Project(name: "Album #\(album)")
        try #require(project.items.isEmpty)

        for song in 1...itemsPerProject {
            let item = ToDoItem(name: "Write song #\(song)")
            project.addToDoItem(item)
        }

        user.addProject(project)
    }

    return user
}

struct TestViewModel {
    var names: [String] = []
    func loadNames() async throws {
        
    }
}

@Suite("User account tests", .timeLimit(.minutes(1)))
struct UserTests {
    @Test func outstandingTasksStringIsPlural() throws {
        // given
        let sut = try createTestUser(projects: 3, itemsPerProject: 10)

        // when
        let rowTitle = sut.outstandingTasksString

        // then
        #expect(rowTitle == "30 items")
    }
    
    @Test func outstandingTasksStringIsSingular() throws {
        // given
        let sut = try createTestUser(projects: 1, itemsPerProject: 1)

        // when
        let rowTitle = sut.outstandingTasksString

        // then
        #expect(rowTitle == "1 item")
    }
    
    @Test(.tags(.mainActorTests))
    func loadNames() async {
        let viewModel = TestViewModel()

        await withKnownIssue("Names can sometimes come back with too few values", isIntermittent: true) { @MainActor in
            try await viewModel.loadNames()
            #expect(viewModel.names.isEmpty == true, "Names should be full of values.")
        }
    }
}
