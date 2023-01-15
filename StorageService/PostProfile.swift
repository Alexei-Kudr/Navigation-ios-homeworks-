//
//  PostProfile.swift
//  Navigation
//
//

import Foundation

public struct ProfilePost {
    public let author: String //никнейм автора публикации
    public var description: String //текст публикации
    public let image: String //имя картинки из каталога
    public let likes: Int //количество лайков
    public let views: Int //количество просмотров
    
    
    public static func posts() -> [ProfilePost] {
        var array = [ProfilePost]()
        array.append(ProfilePost(author: "Vasya", description: "HI PEOPLE", image: "kot", likes: 134, views: 276))
        array.append(ProfilePost(author: "Fedya", description: "текст публикации1", image: "рио", likes: 123, views: 23))
        array.append(ProfilePost(author: "Kolya", description: "текст публикации2", image: "kot", likes: 123, views: 23))
        array.append(ProfilePost(author: "Igor", description: "текст публикации3", image: "русалочка", likes: 123, views: 23))
        array.append(ProfilePost(author: "Tolik", description: "текст публикации4", image: "скрудж и крабс", likes: 123, views: 23))
        
        return array
    }
}
