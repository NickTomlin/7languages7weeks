class Person(val name:String)

trait Nice {
    def greet() = println("Howdily doodily.")
}

trait Introduce {
    def introduce() = println("Hi, my name is" + self(name))
}

class Character(override val name:String) extends Person(name) with Nice with Introduce

val flanders = new Character("Ned")
flanders.greet
