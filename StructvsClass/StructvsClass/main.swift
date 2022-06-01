//
//  main.swift
//  StructvsClass
//
//  Created by 김희진 on 2022/05/30.
//

import Foundation

print("Hello, World!")

let hero = ClassSuperhero(name: "heejin", universe: "marvel")
var hero2 = StructSuperhero(name: "heejin", universe: "marvel")

//hero.name = "Cat Woman"
//hero.universe = "DC"
//hero2.name = "Cat Woman"
//hero2.universe = "DC"

// struct내부의 프로포티 값을 변경할때 이렇게 해라
hero2.reverseName()
print(hero2.name)
