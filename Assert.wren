/**
 * Assertion library for unit testing in Wren.
 *
 * @author Rob Loach (@RobLoach)
 * @license MIT
 * @website https://github.com/RobLoach/wren-assert
 */
class Assert {
  /**
   * Assert that the two given values are equal.
   */
  static equal(actual, expected) {
    equal(actual, expected, "Expected inputs to be equal: %(actual) != %(expected)")
  }

  /**
   * Assert that the two given values are equal, with a given message.
   */
  static equal(actual, expected, message) {
    if (actual != expected) {
      Fiber.abort(message)
    }
  }

  /**
   * Asserts that the two given values are equal.
   *
   * Alias for Assert.equal(actual, expected).
   */
  static [actual, expected] {
    equal(actual, expected)
  }

  /**
   * Asserts that the two given values are equal, with a message.
   *
   * Alias for Assert.equal(actual, expected, message).
   */
  static [actual, expected, message] {
    equal(actual, expected, message)
  }

  /**
   * Assert that the two given values are not equal.
   */
  static notEqual(actual, expected) {
    notEqual(actual, expected, "Expected inputs to be equal: %(actual) == %(expected)")
  }

  /**
   * Assert that the two given values are not equal, with a given message.
   */
  static notEqual(actual, expected, message) {
    if (actual == expected) {
      Fiber.abort(message)
    }
  }

  /**
   * Assert that the given value results as a true condition.
   */
  static ok(value) {
    ok(value, "Expected input to be ok: %(value)")
  }

  /**
   * Assert that the given value results as a true condition, with a given message.
   */
  static ok(value, message) {
    if (!value) {
      Fiber.abort(message)
    }
  }

  /**
   * Asserts that the given value is ok.
   *
   * Alias for Assert.ok(value).
   */
  static [value] {
    ok(value)
  }

  /**
   * Assert that the given function aborts.
   */
  static aborts(fn) {
    aborts(fn, "Expected function to abort.")
  }

  /**
   * Assert that the given function aborts, with a given message.
   */
  static aborts(fn, message) {
    var fiber = Fiber.new(fn)
    fiber.try()
    if (!fiber.error) {
      Fiber.abort(message)
    }
  }

  /**
   * Assert that the given function does not abort.
   */
  static doesNotAbort(fn) {
    var fiber = Fiber.new(fn)
    fiber.try()
    if (fiber.error) {
      Fiber.abort("The function aborted unexpectedly: " + fiber.error)
    }
  }

  /**
   * Assert that the given function does not abort, with a given message.
   */
  static doesNotAbort(fn, message) {
    var fiber = Fiber.new(fn)
    fiber.try()
    if (fiber.error) {
      Fiber.abort(message)
    }
  }

  /**
   * Assert that the given object matches the given type.
   */
  static typeOf(object, type) {
    typeOf(object, type, "Expected %(object) to be of type %(type)")
  }

  /**
   * Assert that the given object matches the given type, with a message.
   */
  static typeOf(object, type, message) {
    if (object is type) {
      // TODO: Find out if there's an "is not" operator.
    } else {
      Fiber.abort(message)
    }
  }

  /**
   * Assert that a list matches a given count.
   */
  static countOf(list, count) {
    countOf(list, count, "Expected the list to have a count of %(count)")
  }

  /**
   * Assert that a list matches a given count, with a message.
   */
  static countOf(list, count, message) {
    equal(list.count, count, message)
  }
}
