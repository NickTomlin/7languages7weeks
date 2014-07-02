doFile("includes.io")

section("Enhance the XML program to add spaces to show the indentation structure.",

  Builder := Object clone
  Builder tabStop ::= 2

  Builder forward := method(
      args := call message arguments
      level := 0

      if (args at(-1) type == Number,
        level := args at(-1)
        args := args slice(0, -1)
      )

      indentation := level * self tabStop

      # ability to pass indentation in?
      writeln("<", call message name, ">")
      args foreach(
      arg,
      content := self doMessage(arg);
      if(content type == "Sequence", writeln(content)))
      writeln("</", call message name, ">")
  )

  Builder ul(li("Io"), li("Lua"), li("JavaScript"))
)
