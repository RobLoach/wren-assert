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
      fail(message)
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
      fail(message)
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
      fail(message)
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
      fail(message)
    }
  }

  /**
   * Assert that the given function does not abort.
   */
  static doesNotAbort(fn) {
    var fiber = Fiber.new(fn)
    fiber.try()
    if (fiber.error) {
      fail("Expected the function to not abort: " + fiber.error)
    }
  }

  /**
   * Assert that the given function does not abort, with a given message.
   */
  static doesNotAbort(fn, message) {
    var fiber = Fiber.new(fn)
    fiber.try()
    if (fiber.error) {
      fail(message)
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
    if (!(object is type)) {
      fail(message)
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

  /**
   * Asserts that the two given objects, and their children, are equal, with a message.
   */
  static deepEqual(actual, expected, message) {
    if (actual is Sequence && expected is Sequence) {
      if (actual.count != expected.count) {
        fail(message)
      }
      for (i in 0..actual.count - 1) {
        deepEqual(actual[i], expected[i], message)
      }
    } else {
      equal(actual, expected, message)
    }
  }

  /**
   * Asserts that the two given objects, and their children, are equal.
   */
  static deepEqual(actual, expected) {
    deepEqual(actual, expected, "Expected the given sequences are deepEqual")
  }

  /**
   * Asserts that the given value is not null.
   */
  static exists(value, message) {
    notEqual(value, null, message)
  }

  /**
   * Asserts that the given value is not null.
   */
  static exists(value) {
    notEqual(value, null, "Expected the given value to not be null")
  }

  /**
   * Asserts that the given value is null.
   */
  static notExists(value, message) {
    equal(value, null, message)
  }

  /**
   * Asserts that the given value is null.
   */
  static notExists(value) {
    notExists(value, "Expected the given value to be null")
  }

  /**
   * Asserts that the given sequence haystack contains the given needle value.
   */
  static contains(haystack, needle, message) {
    if (haystack is Sequence) {
      ok(haystack.contains(needle), message)
    } else {
      equal(haystack, needle, message)
    }
  }

  static contains(haystack, needle) {
    contains(haystack, needle, "The given haystack sequence does not contain the value %(needle)")
  }

  /**
   * Throws an abort on the current fiber with the given message.
   */
  static fail(message) {
    if (!__disabled) {
      Fiber.abort(message)
    }
  }

  /**
   * Throws an abort on the current fiber.
   */
  static fail() {
    fail("There was a failed assertion.")
  }

  /**
   * Throws an abort on the current fiber, using a built message.
   */
  static fail(actual, expected, operator) {
    fail("Expected that %(actual) %(operator) %(expected)")
  }

  /**
   * Throws an assert on the given fiber, assuming an equal operator.
   */
  static fail(actual, expected) {
    fail(actual, expected, "==")
  }

  /**
   * Gets whether or not assertions should be skipped.
   */
  static disabled { __disabled }
  /**
   * Set `Assert.disabled = true` to have assertions skip avoid throwing Fiber.aborts().
   */
  static disabled=(value) { __disabled = value}
}
