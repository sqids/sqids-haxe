# [Sqids Haxe](https://sqids.org/haxe)

[![Github Actions](https://img.shields.io/github/actions/workflow/status/sqids/sqids-haxe/tests.yml)](https://github.com/sqids/sqids-haxe/actions)

[Sqids](https://sqids.org/haxe) (*pronounced "squids"*) is a small library that lets you **generate unique IDs from numbers**. It's good for link shortening, fast & URL-safe ID generation and decoding back into numbers for quicker database lookups.

Features:

- **Encode multiple numbers** - generate short IDs from one or several non-negative numbers
- **Quick decoding** - easily decode IDs back into numbers
- **Unique IDs** - generate unique IDs by shuffling the alphabet once
- **ID padding** - provide minimum length to make IDs more uniform
- **URL safe** - auto-generated IDs do not contain common profanity
- **Randomized output** - Sequential input provides nonconsecutive IDs
- **Many implementations** - Support for [40+ programming languages](https://sqids.org/)

## 🧰 Use-cases

Good for:

- Generating IDs for public URLs (eg: link shortening)
- Generating IDs for internal systems (eg: event tracking)
- Decoding for quicker database lookups (eg: by primary keys)

Not good for:

- Sensitive data (this is not an encryption library)
- User IDs (can be decoded revealing user count)

## 🚀 Getting started

Add using haxelib:

```bash
haxelib install sqids
```

## 👩‍💻 Examples

Simple encode & decode:

```haxe
var sqids = new Sqids();
var id = sqids.encode([1, 2, 3]); // "86Rf07"
var numbers = sqids.decode(id); // [1, 2, 3]
```

> **Note**
> 🚧 Because of the algorithm's design, **multiple IDs can decode back into the same sequence of numbers**. If it's important to your design that IDs are canonical, you have to manually re-encode decoded numbers and check that the generated ID matches.

Enforce a *minimum* length for IDs:

```haxe
var sqids = new Sqids({
    minLength: 10,
});

var id = sqids.encode([1, 2, 3]); // "86Rf07xd4z"
var numbers = sqids.decode(id); // [1, 2, 3]
```

Randomize IDs by providing a custom alphabet:

```haxe
var sqids = new Sqids({
  alphabet: 'k3G7QAe51FCsPW92uEOyq4Bg6Sp8YzVTmnU0liwDdHXLajZrfxNhobJIRcMvKt',
});

var id = sqids.encode([1, 2, 3]); // "XRKUdQ"
var numbers = sqids.decode(id); // [1, 2, 3]
```

Prevent specific words from appearing anywhere in the auto-generated IDs:

```haxe
var sqids = new Sqids({
    blocklist: ["86Rf07"]
});

var id = sqids.encode([1, 2, 3]); // "se8ojk"
var numbers = sqids.decode(id); // [1, 2, 3]
```

## 📝 License

[MIT](LICENSE)
