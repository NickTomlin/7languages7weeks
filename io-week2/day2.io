doFile("includes.io")

section("1. Fibonnaci
A Fibonacci sequence starts with two 1s. Each subsequent num- ber is the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.",
loopFib := method( nth,
    counter := 0
    fibs := list(1, 1)
    while (counter < nth - 2,
      fibs append(
        fibs slice(-2) sum
      );
      counter = counter + 1

    fibs at (-1)
    )
  )

  writeln("loopFib(8): ", loopFib(8))

  recursiveFib := method(
    nth,
    fibs,
    fibs ifNil (fibs = list(1,1))
    if (fibs size >= nth, return fibs at(nth -1))

    fibs append(
      fibs slice(-2) sum
    )

    recursiveFib(nth, fibs)
  )
)

section("2. How would you change / to return 0 if the denominator is zero?",

  Number divide := Number getSlot("/") clone

  Number / := method(
    denominator,
    numerator := call target

    if (denominator == 0,
      0,
      numerator divide(denominator)
    )
  )

  (6 / 2) println
  (5 / 0) println
)

section("3. Write a program to add up all of the numbers in a two-dimensional
  array.",
  # this is a bit naive
  # and would probaby be better served
  # by something that maps checks for type
  sum2d := method(
    source,
    source reduce(prev, next,
      prev sum + next sum
    )
  )
  sum2d(list(list(1,2), list(3,4))) println
)
section("4. Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)",
  # io will raise it's own exception if this is not true
  List myAverage := method(
    self reduce(x, y,
      if (
        x type != "Number" or y type != "Number",
        Exception raise("You cannot sum a list that does not contain numbers")
      )
      x + y
    )
  )

  list(1,2,3,4) myAverage println

  try (
    list(1,2,3,4, "5") myAverage println
  ) catch (Error,
    Error println
  )
)
section("5. Write a prototype for a two-dimensional list. The dim(x, y) method should allocate a list of y lists that are x elements long. set(x, y, value) should set a value, and get(x, y) should return that value.",
  Matrix := List clone do (
    dim := method(x, y,
      self empty
      # the Range setRange synatx is awkward
      # but I couldn't find a way to properly implement
      # the 1 to(10) syntax listed in the docs
      Range setRange(0, y) asList foreach(num,
        self append(
          Range setRange(0, x) asList
        )
      )
    )

    set := method (x, y, value,
      self at(x) atPut(y, value)
    )

    get := method(x, y,
      self at(x) at(y)
    )

    # TODO: this is gross. Clean it up
    transpose := method(
      newMatrix := matrix clone
      # we are going through
      # each row and creating a new list
      # because the number of columns is the deciding factor
      # for the number of rows
      self foreach(i, row,
        row foreach(index, item,
          if(newMatrix at(index) isNil,
            newMatrix atInsert(index, list())
          )
        )
      )

      newMatrix map(index, row,
        l := list()
        self foreach(i, l append(i at (index)))
      )
    )
  )

  matrix := Matrix clone
  matrix dim(1, 1)
  matrix set(0, 0, 1)
  matrix set(0, 1, 2)
  matrix set(1, 0, 3)
  matrix set(1, 1, 4)

  "6. Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list." println

  transposed := matrix transpose
  # borked, because we are returning a list, not a matrix
  (transposed get(1, 0) == matrix get(0, 1)) println

  # write the matrix to a file
  output := File with("matrix.txt")
  output remove
  output openForUpdating
  output write(matrix asString)
  output write("\n")
  output close
)

section("6. Write a program that gives you ten tries to guess a random number from 1–100. If you would like, give a hint of “hotter” or “colder” after the first guess.",
  "Todo"
)
