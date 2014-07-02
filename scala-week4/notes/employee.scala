class Person(val name: String) {
    def talk(message: String) = println(name + " says " + message)
    def id(): String = name
}

class Employee(override val name: String,
                        val number: Int) extends Person(name) {
    override def talk(message: String) {
        println(name + " with number " + number + " says " + message)
    }
    override def id():String = number.toString
}

val luke = new Person("Luke")
luke.talk("I used to bullseye womp rats in my T-16 back home")
val employee = new Employee("Yoda", 4)
employee.talk("extend or extend not. There is no try.")
