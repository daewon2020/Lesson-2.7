//
//  Person.swift
//  Lesson 2.7
//
//  Created by Kostya on 24.03.2022.
//

struct Person {
    let name: String
    let surname: String
    let email: String
    let phoneNumber: String
    var fullname: String {
        "\(name) \(surname)"
    }
    var fullEmail: String {
        "E-mail: \(email)"
    }
    var fullPhoneNumber: String {
        "Phone: \(phoneNumber)"
    }
    
    static func getRandomPersonListFrom() -> [Person] {
        
        let personsData = DataManager()
        let shuffledNames = personsData.names.shuffled()
        let shuffledSurnames = personsData.surnames.shuffled()
        var personList = [Person]()
        
        for index in 0..<shuffledNames.count {
            let randomEmail = shuffledNames[index].lowercased() +
            (personsData.emailDomains.randomElement() ?? "")
            let randomPhoneNumber = String(Int.random(in: 0...1000000))
            let person = Person(
                name: shuffledNames[index],
                surname: shuffledSurnames[index],
                email: randomEmail,
                phoneNumber: randomPhoneNumber
            )
            
            personList.append(person)
        }
        return personList
    }
}
