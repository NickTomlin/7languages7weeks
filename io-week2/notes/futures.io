slowMethod := method(
  wait(1)
  "This will execute with a delay"
)

result := @slowMethod

"this will execute immediately" println

result println
