doFile("includes.io")

section("Conditionals",
  if (
    true,
    "Its true yo" println; "and some stuff is happening" ,
    "Its false yo" println; "this is not going to happen"
  )

  if (true) then (
    "its true!"
  ) else (
    "it's not true :("
  )
)

section("Operators",
  "operators are special types of symbols,
  you can see the whole list via OperatorTable"
  OperatorTable println
)

section("Messages
# call
provides properties to introspect into a message:
 target - the object the message is being sent to
 sender - the object sending the message
 message arguments - the arguments
 message name - the name of the message
",
postOffice := Object clone
postOffice packageSender := method(call sender)

mailer := Object clone
mailer deliver := method(postOffice packageSender)

postOffice messageArgs := method(call message arguments)
postOffice messageTarget := method(call target)
postOffice messageName := method(call message name)

mailer deliver println
)
