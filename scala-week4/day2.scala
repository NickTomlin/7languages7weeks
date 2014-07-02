/*
Find:
    • A discussion on how to use Scala files
    • What makes a closure different from a code block
Do:
    • Write a Censor trait with a method that will replace the curse words Shoot and Darn with Pucky and Beans alternatives. Use a map to store the curse words and their alternatives.
    • Load the curse words and alternatives from a file.
*/

// Use foldLeft to compute the total size of a list of strings.
List("Bob", "Bill", "Bab", "Biz", "Boz")
    .foldLeft(0)((sum, string)  => sum + string.size)
// write a Censor trait with a method that will
