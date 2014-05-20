doFile("includes.io")

list(
"=== Find ===
* a group
 - https://groups.yahoo.com/neo/groups/iolanguage/info
 - #io channel on freenode
* an io styleguide
 - http://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide (borked)
* examples
- https://github.com/stevedekorte/io/tree/master/samples/misc",

"=== Do ===,
 - Evaluate 1 + 1 and then 1 + 'one'. Is Io strongly typed or weakly typed? Support your answer with code.",
"1 + 1 === 2",
(1 + 1 == 2),
# not sure if this actually indicates strong or weak typeage
# it doesn't do conversion for you behind the scenes
"1 + 1 == '2'",
(1 + 1 == "2"),
"1 + \"1\" == 2",
" - Is 0 true or false? What about the empty string? Is nil true or false? Support your answer with code."
) foreach(println)

list(
if nil "nil is not falsy" println,
if 0 "0 is not falsy" println
)

" - how can you tell what slots a prototype supports?" println
Bar := Object clone
Bar name := "Bar"
Bar hello := method("Hello there." println)
bar := Bar clone
"slots of #{bar name}" interpolate println
bar proto slotNames foreach(i, v, write("#", i, " : ", v, "\n"))

" - what is the difference between := ::= and = " println
" ::= is for creating a slot and a setter for that slot" println
Person := Object clone do(
  name ::= nil
  age  ::= nil
)

bob := Person clone setName("Bob") setAge(40)

" := is for assigning a value to a slot" println
bob tellAge := method("My age is #{self age}" interpolate)
bob tellAge println

" = is for assigning a value to a slot, throwing an exception if it does not exist" println
try (
  bob willNotWork = "this is going to throw an exception"
) catch (
  Exception,
  "Caught a nasty exception" println
)
