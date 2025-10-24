//
//  Player.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/24/25.
//

struct Player {
    var name: String
    var friends = [Player]()

    @TaskLocal static var current = Player(name: "Anonymous")
}

func createWelcomeScreen() -> String {
    var message = "Welcome, \(Player.current.name)!\n"
    message += "Friends online: \(Player.current.friends.count)"
    return message
}
