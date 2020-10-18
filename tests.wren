import "./Assert" for Assert

// Assert.equal
Assert.equal(3, 3)
Assert.equal("Hello World!", "Hello World!")
Assert.equal(3, 3, "3 is equal to 3")
Assert.equal("Hello World!", "Hello World!", "This is a hello to the world!")
Assert.aborts(Fn.new{Assert.equal(5, 10)})

// Assert[expected, actual, [message]]
Assert[5, 5]
Assert.aborts(Fn.new { Assert[5, 10] })
Assert[5, 5, "Five equal five!"]
Assert.aborts(Fn.new { Assert[5, 10, "Five equals ten?"] })

// Assert.notEqual
Assert.notEqual(5, 10)
Assert.notEqual(5, 10, "5 is somehow equal to 10")

// Assert.ok
Assert.ok(true)
Assert.ok(true, "This should be okay")

// Assert[value]
Assert[true]
Assert.aborts(Fn.new { Assert[false] })

// Assert.aborts
var functionThatAborts = Fn.new {
  Fiber.abort("The function has aborted.")
}
Assert.aborts(functionThatAborts)
Assert.aborts(functionThatAborts, "The function has aborted correctly.")

// Assert.doesNotAbort
var functionThatDoesNotAbort = Fn.new {
  Assert.equal(5, 5)
}
Assert.doesNotAbort(functionThatDoesNotAbort)
Assert.doesNotAbort(functionThatDoesNotAbort, "The function aborted, when it should not have.")

// Assert.typeOf
Assert.typeOf(5, Num)
Assert.typeOf(5, Num, "Expected the number to be a number.")
Assert.typeOf("Hello World!", String)

// Assert.countOf
var list = [1, 2, 3]
Assert.countOf(list, 3)
Assert.countOf(list, 3, "Expected [1,2,3] to have a count of 3")

// Finish up
System.print("Assert had no errors")
