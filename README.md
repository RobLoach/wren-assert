# wren-assert

Assertion library for unit testing in [Wren](https://wren.io).

## Installation

Copy [`Assert.wren`](Assert.wren) and [`LICENSE`](LICENSE) to your project.

## Usage

The `Assert` class is inspired by [Node.js's `assert` module](https://nodejs.org/api/assert.html), so the methods are similar.

### Example

``` js
import "./Assert" for Assert

Assert.equal(5, 5)
Assert.equal(5, 5, "Expected 5 to equal 5")
Assert[5, 5]
Assert[5, 5, "Expected 5 to equal 5"]

Assert.notEqual(5, 10)
Assert.notEqual(5, 10, "Expected 5 to not equal 10")

Assert.ok(true)
Assert.ok(true, "True should be ok")
Assert[true]

Assert.aborts(Fn.new {
  Fiber.abort("This function is expected to abort.")
})

Assert.doesNotAbort(Fn.new {
  System.print("This function does not abort, as expected.")
})

Assert.typeOf(5, Num)
Assert.typeOf(5, Num, "Expected the number to be a Num.")

Assert.countOf([1, 2, 3], 3)
Assert.countOf([1, 2, 3], 3, "Expect a list count of 3.")

Assert.deepEqual([1, 2, 3], [1, 2, 3])
Assert.deepEqual([1, 2, 3], [1, 2, 3], "Expected the two lists to be the same.")

Assert.exists(5)
Assert.exists(5, "Expected 5 to not be null")

Assert.notExists(null)
Assert.notExists(null, "Expected null to be null")

Assert.contains([1, 2, 3], 2)
Assert.contains([1, 2, 3], 2, "Expected two to be in the sequence")

Assert.disabled = true // Disables assertion checks
```

### API

``` js
Assert.equal(actual, expected, [message])
Assert[actual, expected, [message]]
Assert.ok(value, [message])
Assert[value]
Assert.notEqual(actual, expected, [message])
Assert.aborts(fn, [message])
Assert.doesNotAbort(fn, [message])
Assert.typeOf(object, type, [message])
Assert.countOf(list, count, [message])
Assert.deepEqual(actual, expected, [message])
Assert.exists(value, [message])
Assert.notExists(value, [message])
Assert.contains(haystack, needle, [message])
Assert.disabled = true // Disables assertion checks
```

## Development

Use [wren-cli](https://github.com/wren-lang/wren-cli) to run the tests...

```
wren_cli tests.wren
```

## License

[MIT](License)
