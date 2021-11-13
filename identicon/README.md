# Identicon

<p align="center" width="100%">
    <img width="20%" src="img/Example.png">
</p>

A second project to enhance and strength my Elixir knowledge. This module generates an image from a string through. The string is converted to an MD5 hash that is then manipulated. The data structure used is a Struct that stores data throughout the whole pipeline and workflow of the code.

---

**NOTE**:
All the commands must be run in the root folder.

---

## Installation

To run this, you need to install [Elixir](https://elixir-lang.org/install.html).

- Install dependencies with `mix deps.get`
- Access interactive environment with `iex -S mix`
- Call the main method and give it a string as an input `Identicon.main("Example")` would generate the Image above!

## Documentation

I have added a documentation with examples with ex_doc tool.

- Generate with `mix docs`
- Open the documentation with `open doc/index.html`

## Tests

There are code examples in the documentation that run as parts of tests, and other tests to test functionalities in the [identicon_test.exs](/test/identicon_test.exs) file.
