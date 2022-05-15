//
//  main.swift
//  ClassDemo
//
//  Created by 김희진 on 2022/05/15.
//


var skeleton = Enemy(health: 100, attackStregth: 10)

print(skeleton.health)
skeleton.move()
skeleton.attack()

var skeleton2 = skeleton
skeleton.takeDemage(amount: 10)
skeleton.takeDemage(amount: 10)
skeleton2.takeDemage(amount: 10)


print(skeleton.health)
print(skeleton2.health)


//let dragon = Dragon()
//dragon.wingspan = 5
//dragon.attackStrength = 20
//dragon.talk(speech: "My teeth are swords!")
//dragon.move()
//dragon.attack()
