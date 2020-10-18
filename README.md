# wren-assert

Assertion library for unit testing in [Wren](https://wren.io).

## Installation

Copy [`Assert.wren`](Assert.wren) and [`LICENSE`](LICENSE) to your project.

## Usage

```
import "./Assert" for Assert

Assert[5, 5]
Assert.equal(5, 5)
Assert[5, 5, "Expected 5 to equal 5"]
Assert.equal(5, 5, "Expected 5 to equal 5")
Assert.notEqual(5, 10)
Assert.notEqual(5, 10, "Expected 5 to not equal 10")
Assert[true]
Assert.ok(true)
Assert.ok(true, "True should be ok")
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
```

## API

The follow are the methods defined in the Assert module.

### `Assert.equal(actual, expected, [message])`
### `Assert[actual, expected, [message]]`
Alias of `Assert.equal()`.
### `Assert.notEqual(actual, expected, [message])`
### `Assert.ok(value, [message])`
### `Assert[value]`
Alias of `Assert.ok()`
### `Assert.aborts(fn, [message])`
### `Assert.doesNotAbort(fn, [message])`
### `Assert.typeOf(object, type, [message])`
### `Assert.countOf(list, count, [message])`

## Development

Use [wren-cli](https://github.com/wren-lang/wren-cli) to run the tests...

```
wren_cli tests.wren
```

## License

[MIT](License)
