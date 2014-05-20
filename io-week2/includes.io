# non working...
Sequence * := method(
  call message arguments println
  times := call message argAt(0)
  output := ""
  times println

  while(times > 0,
      "foo" println;
    times = times - 1
  )

  output size println
  output
)

section := method(
  sectionText,
  lines := sectionText split("\n")
  heading := lines at(0)
  body := lines slice(1)

  "=== #{heading} ===" interpolate println
  if (body isNotEmpty) then(body join("\n") println)
  call sender doMessage(call message argAt(1))
)
