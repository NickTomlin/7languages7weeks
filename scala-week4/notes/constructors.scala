class Person(first_name: String) {
    println("outer constructor")
    // whoah??
    def this(first_name: String, last_name: String) {
        this(first_name)
        println("Inner Constructor")
    }
    def talk() = println("Hi")
}

val bob = new Person("Bob")
val bobTate = new Person("Bob", "Tate")
