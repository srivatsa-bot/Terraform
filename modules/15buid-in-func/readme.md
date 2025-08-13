all build in function in tf

### 1) numeric

### `abs(number)`
Returns the absolute (non-negative) value of the number.

```hcl
abs(23)       => 23
abs(0)        => 0
abs(-12.4)    => 12.4
```
### `floor(number)`

Returns the greatest whole number less than or equal to the number.

```hcl
floor(5)      => 5
floor(4.9)    => 4
```
### `ceil(number)`

Returns the smallest whole number greater than or equal to the number.

```hcl
ceil(5)       => 5
ceil(5.1)     => 6
```
### `log(number, base)`

Returns the logarithm of number in the given base.

```hcl
log(50, 10)   => 1.69897
log(16, 2)    => 4 
```

### `min(x, y, ...)`

Returns the smallest number among the arguments.
```hcl
min(10, 5, 3) => 3
```

### `max(x, y, ...)`

Returns the largest number among the arguments.
```hcl
max(10, 5, 3) => 10
```

### Note min,max can be applied on sets

### `pow(base, exponent)`

Returns base raised to the power of exponent.

```sh
pow(3, 2)     => 9
pow(4, 0)     => 1
```

### `signum(number)`

Returns the sign of the number:

    -1 for negative
    0 for zero
    1 for positive

```hcl
signum(-13)   => -1
signum(0)     => 0
signum(344)   => 1
```

### `parseint(string, base)`

Parses a string as an integer in the given base.

```hcl
parseint("100", 10)          => 100
parseint("FF", 16)           => 255
parseint("-10", 16)          => -16
parseint("1011111011101111", 2) => 48879
parseint("aA", 62)           => 656
parseint("12", 2)            => Error (invalid base-2 number)

```

---

### `2) Strign functions`

# 🧵 Terraform String Functions Cheat Sheet

This cheat sheet summarizes the most useful Terraform string functions with examples.

---

## 🐡 Basic String Manipulation

### `chomp(string)`

Removes newline characters (`\n`, `\r\n`, etc.) from the end of a string.

```hcl
chomp("hello\n")      => "hello"
chomp("hello\r\n")    => "hello"
```

---

### `lower(string)`

Converts all characters in the string to lowercase.

```hcl
lower("HELLO")        => "hello"
```

---

### `title(string)`

Capitalizes the **first letter** of each word in a string.

```hcl
title("hello world")  => "Hello World"
```

---

### `trim(string, chars)`

Removes specified characters from the **start and end** of the string.

```hcl
trim("?!hello?!", "!?") => "hello"
```

---

### `strrev(string)`

Reverses the characters in a string.

```hcl
strrev("hello")       => "olleh"
```

---

## 🤩 String Construction & Formatting

### `format(format_string, values...)`

Formats strings using placeholders like `%s` for string and `%d` for integer.

```hcl
format("Hello, %s!", "Ander")            => "Hello, Ander!"
format("There are %d lights", 4)         => "There are 4 lights"
```

---

### `formatlist(format_string, list_of_values)`

Returns a list of formatted strings using the format string and list.

```hcl
formatlist("Hello, %s!", ["Valentina", "Ander", "Olivia", "Sam"])
=> [
  "Hello, Valentina!",
  "Hello, Ander!",
  "Hello, Olivia!",
  "Hello, Sam!"
]

formatlist("%s, %s!", "Salutations", ["Valentina", "Ander", "Olivia", "Sam"])
=> [
  "Salutations, Valentina!",
  ...
]
```

---

### `join(delimiter, list)`

Concatenates a list of strings using a specified delimiter.

```hcl
join(", ", ["foo", "bar", "baz"]) => "foo, bar, baz"
join(",", ["foo"])                => "foo"
```

---

### `indent(count, string)`

Adds a number of spaces to the beginning of each line **except the first**.

```hcl
"items: ${indent(2, "[\n foo,\n bar,\n]")}" =>
items: [
  foo,
  bar,
]
```

---

## 🔍 String Parsing and Replacement

### `replace(input, pattern, replacement)`

Replaces all occurrences of a pattern with a replacement string.

```hcl
replace("hello world", "/w.*d/", "everybody")
=> "hello everybody"
```

---

### `split(delimiter, string)`

Splits a string into a list of substrings by a delimiter.

```hcl
split(",", "foo,bar,baz") => ["foo", "bar", "baz"]
```

---

### `substr(string, offset, length)`

Extracts a substring starting from offset with given length.

```hcl
substr("hello world", 1, 4) => "ello"
```

---

## 🔪 Regex Functions

### `regex(pattern, string)`

Applies a regular expression to a string and returns **named groups**.

```hcl
regex(
  "^(?:(?P<scheme>[^:/?#]+):)?(?://(?P<authority>[^/?#]*))?",
  "https://terraform.io/docs/"
)
=> {
  "scheme"    = "https"
  "authority" = "terraform.io"
}
```

---

### `regexall(pattern, string)`

Returns **all matches** for a pattern as a list.

```hcl
regexall("[a-z]+", "abc 123 def") => ["abc", "def"]
```

---

## 📌 Notes

* Most string functions can be tested in `terraform console`
* `%s` is used for strings, `%d` for integers in format/formatlist
* Use regular expressions carefully for pattern extraction

---

📚 Learn more: [Terraform String Functions](https://developer.hashicorp.com/terraform/language/functions#string-functions)

---

### `3)Collections`
Here’s the **README.md-style summary** of all the collection functions shown in the screenshots you've provided:



# 📚 Terraform Collection Functions

Collection functions allow you to manipulate and query collections (lists, maps, sets). Below are the key collection functions in Terraform with examples.

---

## ✅ `alltrue`
Returns `true` if **all elements** are true or the string `"true"` (also returns true if the list is empty).
```hcl
alltrue(["true", true])       # true
alltrue([true, false])        # false
```

---

## ✅ `anytrue`
Returns `true` if **any element** is true or `"true"` (returns false for empty list).
```hcl
anytrue(["true"])             # true
anytrue([true])               # true
anytrue([true, false])        # true
anytrue([])                   # false
```

---

## 🧩 `chunklist`
Splits a list into **fixed-size chunks** (returns list of lists).
```hcl
chunklist(["a", "b", "c", "d", "e"], 2)
# => [["a", "b"], ["c", "d"], ["e"]]
```

---

## 🔄 `coalesce`
Returns the **first non-null or non-empty string** from the arguments.
```hcl
coalesce("a", "b")            # "a"
coalesce("", "b")             # "b"
coalesce(1, 2)                # 1
```

---

## 🔄 `coalescelist`
Returns the **first non-empty list** from the arguments.
```hcl
coalescelist(["a", "b"], ["c", "d"]) # ["a", "b"]
```

---

## ✂️ `compact`
Removes **empty strings** from a list.
```hcl
compact(["a", "", "b", "c"])  # ["a", "b", "c"]
```

---

## ➕ `concat`
Combines two or more lists into one.
```hcl
concat(["a", ""], ["b", "c"]) # ["a", "", "b", "c"]
```

---

## 🔍 `contains`
Checks if a list or set **contains a value**.
```hcl
contains(["a", "b", "c"], "a") # true
contains(["a", "b", "c"], "d") # false
```

---

## 🧹 `distinct`
Removes **duplicate elements** from a list.
```hcl
distinct(["a", "b", "a", "c", "d", "b"]) # ["a", "b", "c", "d"]
```

---

## 🎯 `element`
Gets a single element at an index **(uses modulo indexing)**.
```hcl
element(["a", "b", "c"], 3)    # "a"
```

---

## 🔢 `index`
Finds the index of a value in a list.
```hcl
index(["a", "b", "c"], "b")    # 1
```

---

## 🗝️ `keys`
Returns the **keys of a map** as a list.
```hcl
keys({a=1, c=2, d=3})         # ["a", "c", "d"]
```

---

## 🧹 `flatten`
Flattens a **nested list** into a single list.
```hcl
flatten([[[ "a", "b" ]], [], ["c"]]) # ["a", "b", "c"]
```

---

## 📏 `length`
Returns the **number of items** in a list, map, or string.
```hcl
length([])                    # 0
length(["a", "b"])            # 2
length({"a" = "b"})           # 1
length("hello")               # 5
```

---

## 🔍 `lookup`
Returns value for key in map, or a **default** if key not found.
```hcl
lookup({a="ay", b="bee"}, "a", "what?") # "ay"
lookup({a="ay", b="bee"}, "c", "what?") # "what?"
```

---

## 🔁 `matchkeys`
Returns elements from first list whose indexes match those of matching elements in the second list.
```hcl
matchkeys(
  ["i-123", "i-abc", "i-def"],
  ["us-west", "us-east", "us-east"],
  ["us-east"]
)
# => ["i-abc", "i-def"]
```

---

Of course, here is a `readme.md` file based on the provided image.

-----

# Terraform Collection Functions

This document provides a quick reference for several useful collection functions in Terraform's HashiCorp Configuration Language (HCL). These functions help manipulate and process collections like lists, sets, and maps.

## `sum`

The `sum` function takes a list or set of numbers and returns the sum of those numbers.

### Example

```hcl
> sum([10, 13, 6, 4.5])
33.5
```

-----

## `transpose`

The `transpose` function takes a map of lists of strings and swaps the keys and values. The result is a new map where the keys are the unique values from the input lists, and the values are lists of the original keys.

### Example

```hcl
> transpose({"a" = ["1", "2"], "b" = ["2", "3"]})
{
  "1" = [
    "a",
  ],
  "2" = [
    "a",
    "b",
  ],
  "3" = [
    "b",
  ],
}
```

-----

## `values`

The `values` function takes a map and returns a list containing the values of the elements in that map. Note that the order of the returned values is not guaranteed.

### Example

```hcl
> values({a=3, c=2, d=1})
[
  3,
  2,
  1,
]
```

-----

## `zipmap`

The `zipmap` function constructs a map from a list of keys and a corresponding list of values. The lists must have the same number of elements.

### Example

```hcl
> zipmap(["a", "b"], [1, 2])
{
  "a" = 1,
  "b" = 2,
}
```
---

### `4) encoding and decoding`

# 🧩 Encoding and Decoding Functions

This repository provides a collection of functions for encoding and decoding data in various formats. These utilities are ideal for transforming data for storage, transmission, or processing in infrastructure workflows.

---

## 🔧 Functions

### ✨ Encoding
- `base64encode`
- `jsonencode`
- `textencodebase64`
- `Yamlencode`
- `base64gzip`
- `urlencode`

### 🔍 Decoding
- `base64decode`
- `csvdecode`
- `jsondecode`
- `textdecodebase64`
- `yamldecode`

---

## 📌 Examples

### Base64 Encoding
```hcl
> base64encode("Hello World")
SGVsbG8gV29ybGQ=
```
---
---


### `5Filesystem`

# Terraform Filesystem Functions

This guide covers essential Terraform filesystem functions for path manipulation and file operations.

## Path Manipulation Functions

### `abspath()`
Converts a filesystem path to an absolute path by joining it with the current working directory if it's not already absolute.

**Syntax:** `abspath(path)`

**Example:**
```hcl
> abspath(path.root)
/home/user/some/terraform/root
```

### `dirname()`
Takes a filesystem path and removes the last portion (filename) from it, returning the directory path.

**Syntax:** `dirname(path)`

**Example:**
```hcl
> dirname("foo/bar/baz.txt")
foo/bar
```

### `basename()`
Takes a filesystem path and returns only the last portion (filename), removing all directory components.

**Syntax:** `basename(path)`

**Example:**
```hcl
> basename("foo/bar/baz.txt")
baz.txt
```

### `pathexpand()`
Expands filesystem paths that begin with a `~` segment by replacing it with the current user's home directory path.

**Syntax:** `pathexpand(path)`

**Examples:**
```hcl
> pathexpand("~/.ssh/id_rsa")
/home/steve/.ssh/id_rsa

> pathexpand("/etc/resolv.conf")
/etc/resolv.conf
```

## File Operations Functions

### `file()`
Reads the contents of a file at the given path and returns them as a string.

**Syntax:** `file(path)`

**Example:**
```hcl
> file("${path.module}/hello.txt")
Hello World
```

### `fileexists()`
Determines whether a file exists at the given path, returning `true` if it exists and `false` otherwise.

**Syntax:** `fileexists(path)`

**Example:**
```hcl
> fileexists("${path.module}/hello.txt")
true
```

### `fileset()`
Enumerates a set of regular file names matching a given path and pattern, returning a set of matching filenames.

**Syntax:** `fileset(path, pattern)`

**Example:**
```hcl
> fileset(path.module, "files/*.txt")
[
  "files/hello.txt",
  "files/world.txt",
]
```

### `filebase64()`
Reads the contents of a file at the given path and returns them as a base64-encoded string.

**Syntax:** `filebase64(path)`

**Example:**
```hcl
> filebase64("${path.module}/hello.txt")
SGVsbG8gV29ybGQ=
```

## Template Functions

### `templatefile()`
Reads the file at the given path and renders its content as a template using a supplied set of template variables.

**Syntax:** `templatefile(path, vars)`

**Template Example:**
```hcl
# File: backends.tpl
%{ for addr in ip_addrs ~}
backend ${addr}:${port}
%{ endfor ~}
```

**Usage:**
```hcl
> templatefile("${path.module}/backends.tpl", { 
    port = 8080, 
    ip_addrs = ["10.0.0.1", "10.0.0.2"] 
  })
backend 10.0.0.1:8080
backend 10.0.0.2:8080
```

## Common Use Cases

### Configuration File Management
```hcl
# Read a configuration file
locals {
  config_content = file("${path.module}/config.json")
  config_data    = jsondecode(local.config_content)
}
```

### Conditional File Operations
```hcl
# Check if a file exists before using it
locals {
  ssh_key = fileexists("~/.ssh/id_rsa.pub") ? file("~/.ssh/id_rsa.pub") : ""
}
```

### Dynamic Template Rendering
```hcl
# Generate configuration from template
resource "local_file" "nginx_config" {
  content = templatefile("${path.module}/nginx.conf.tpl", {
    server_name = var.domain_name
    port        = var.port
    backends    = var.backend_servers
  })
  filename = "${path.module}/nginx.conf"
}
```

### File Discovery and Processing
```hcl
# Process all JSON files in a directory
locals {
  json_files = fileset("${path.module}/configs", "*.json")
  configurations = {
    for file in local.json_files :
    basename(file) => jsondecode(file("${path.module}/configs/${file}"))
  }
}
```

## Best Practices

1. **Use `path.module`** for relative paths within your module
2. **Validate file existence** with `fileexists()` before reading
3. **Use `templatefile()`** for dynamic configuration generation
4. **Leverage `fileset()`** for bulk file operations
5. **Consider security** when reading files - avoid exposing sensitive data in state

## Path Variables

- `path.module` - The filesystem path of the module where the expression is placed
- `path.root` - The filesystem path of the root module of the configuration
- `path.cwd` - The filesystem path of the current working directory

These functions are essential for managing configuration files, templates, and dynamic content in Terraform configurations.

---

# Terraform Built-in Functions Reference

This comprehensive guide covers essential Terraform built-in functions organized by category: filesystem operations, date and time manipulation, cryptographic functions, IP network operations, and type conversions.

## Path Manipulation Functions

### `abspath()`
Converts a filesystem path to an absolute path by joining it with the current working directory if it's not already absolute.

**Syntax:** `abspath(path)`

**Example:**
```hcl
> abspath(path.root)
/home/user/some/terraform/root
```

### `dirname()`
Takes a filesystem path and removes the last portion (filename) from it, returning the directory path.

**Syntax:** `dirname(path)`

**Example:**
```hcl
> dirname("foo/bar/baz.txt")
foo/bar
```

### `basename()`
Takes a filesystem path and returns only the last portion (filename), removing all directory components.

**Syntax:** `basename(path)`

**Example:**
```hcl
> basename("foo/bar/baz.txt")
baz.txt
```

### `pathexpand()`
Expands filesystem paths that begin with a `~` segment by replacing it with the current user's home directory path.

**Syntax:** `pathexpand(path)`

**Examples:**
```hcl
> pathexpand("~/.ssh/id_rsa")
/home/steve/.ssh/id_rsa

> pathexpand("/etc/resolv.conf")
/etc/resolv.conf
```

## File Operations Functions

### `file()`
Reads the contents of a file at the given path and returns them as a string.

**Syntax:** `file(path)`

**Example:**
```hcl
> file("${path.module}/hello.txt")
Hello World
```

### `fileexists()`
Determines whether a file exists at the given path, returning `true` if it exists and `false` otherwise.

**Syntax:** `fileexists(path)`

**Example:**
```hcl
> fileexists("${path.module}/hello.txt")
true
```

### `fileset()`
Enumerates a set of regular file names matching a given path and pattern, returning a set of matching filenames.

**Syntax:** `fileset(path, pattern)`

**Example:**
```hcl
> fileset(path.module, "files/*.txt")
[
  "files/hello.txt",
  "files/world.txt",
]
```

### `filebase64()`
Reads the contents of a file at the given path and returns them as a base64-encoded string.

**Syntax:** `filebase64(path)`

**Example:**
```hcl
> filebase64("${path.module}/hello.txt")
SGVsbG8gV29ybGQ=
```

## Template Functions

### `templatefile()`
Reads the file at the given path and renders its content as a template using a supplied set of template variables.

**Syntax:** `templatefile(path, vars)`

**Template Example:**
```hcl
# File: backends.tpl
%{ for addr in ip_addrs ~}
backend ${addr}:${port}
%{ endfor ~}
```

**Usage:**
```hcl
> templatefile("${path.module}/backends.tpl", { 
    port = 8080, 
    ip_addrs = ["10.0.0.1", "10.0.0.2"] 
  })
backend 10.0.0.1:8080
backend 10.0.0.2:8080
```

## Common Use Cases

### Configuration File Management
```hcl
# Read a configuration file
locals {
  config_content = file("${path.module}/config.json")
  config_data    = jsondecode(local.config_content)
}
```

### Conditional File Operations
```hcl
# Check if a file exists before using it
locals {
  ssh_key = fileexists("~/.ssh/id_rsa.pub") ? file("~/.ssh/id_rsa.pub") : ""
}
```

### Dynamic Template Rendering
```hcl
# Generate configuration from template
resource "local_file" "nginx_config" {
  content = templatefile("${path.module}/nginx.conf.tpl", {
    server_name = var.domain_name
    port        = var.port
    backends    = var.backend_servers
  })
  filename = "${path.module}/nginx.conf"
}
```

### File Discovery and Processing
```hcl
# Process all JSON files in a directory
locals {
  json_files = fileset("${path.module}/configs", "*.json")
  configurations = {
    for file in local.json_files :
    basename(file) => jsondecode(file("${path.module}/configs/${file}"))
  }
}
```

### Network Configuration
```hcl
# Calculate subnet addresses
locals {
  vpc_cidr = "10.0.0.0/16"
  
  # Create subnets for different tiers
  public_subnets = cidrsubnets(local.vpc_cidr, 8, 8, 8)  # /24 subnets
  private_subnets = cidrsubnets("10.0.128.0/17", 8, 8, 8) # /25 subnets
  
  # Calculate specific host addresses
  nat_gateway_ip = cidrhost(local.public_subnets[0], 10)
}
```

### Timestamp and Naming
```hcl
# Create unique resource names with timestamps
locals {
  deployment_time = timestamp()
  formatted_time  = formatdate("YYYY-MM-DD-hhmm", local.deployment_time)
  
  resource_suffix = substr(sha256("${var.environment}-${local.deployment_time}"), 0, 8)
}

resource "aws_s3_bucket" "backup" {
  bucket = "backup-${var.environment}-${local.formatted_time}-${local.resource_suffix}"
}
```

### Secure Password Generation
```hcl
# Generate and hash passwords securely
resource "random_password" "db_password" {
  length  = 16
  special = true
}

locals {
  # Store hashed version for comparison
  password_hash = bcrypt(random_password.db_password.result)
  
  # Create unique identifiers
  deployment_id = uuid()
}
```

### Type Safety and Validation
```hcl
# Safe type conversions with fallbacks
locals {
  # Convert various input types safely
  port_number = can(tonumber(var.port)) ? tonumber(var.port) : 8080
  
  # Handle optional configurations
  feature_flags = try(
    tomap(var.feature_config),
    {}
  )
  
  # Ensure list format
  allowed_cidrs = tolist(var.allowed_cidrs)
}
```

## Best Practices

1. **Use `path.module`** for relative paths within your module
2. **Validate file existence** with `fileexists()` before reading
3. **Use `templatefile()`** for dynamic configuration generation
4. **Leverage `fileset()`** for bulk file operations
5. **Consider security** when reading files - avoid exposing sensitive data in state
6. **Use `sensitive()`** for marking sensitive values appropriately
7. **Validate inputs** with `can()` before type conversions
8. **Use `try()`** for graceful error handling and fallbacks
9. **Generate unique identifiers** with `uuid()` for resource naming
10. **Hash sensitive data** with appropriate algorithms (avoid MD5 for security)
11. **Use CIDR functions** for systematic network address planning
12. **Format timestamps** consistently across your infrastructure

## Path Variables

- `path.module` - The filesystem path of the module where the expression is placed
- `path.root` - The filesystem path of the root module of the configuration
- `path.cwd` - The filesystem path of the current working directory

These functions are essential for managing configuration files, templates, and dynamic content in Terraform configurations.

## Date and Time Functions

### `formatdate()`
Converts a timestamp into a different time format using Go's time formatting syntax.

**Syntax:** `formatdate(format, timestamp)`

**Examples:**
```hcl
> formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z")
02 Jan 2018 23:12 UTC

> formatdate("EEEE, DD-MMM-YY hh:mm:ss ZZZ", "2018-01-02T23:12:01Z")
Tuesday, 02-Jan-18 23:12:01 UTC

> formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ", "2018-01-02T23:12:01-08:00")
Tue, 02 Jan 2018 23:12:01 -0800

> formatdate("MMM DD, YYYY", "2018-01-02T23:12:01Z")
Jan 02, 2018

> formatdate("HH:mmaa", "2018-01-02T23:12:01Z")
11:12pm
```

### `timeadd()`
Adds a duration to a timestamp, returning a new timestamp.

**Syntax:** `timeadd(timestamp, duration)`

**Example:**
```hcl
> timeadd("2017-11-22T00:00:00Z", "10m")
2017-11-22T00:10:00Z
```

### `timestamp()`
Returns a UTC timestamp string in RFC 3339 format for the current date and time.

**Syntax:** `timestamp()`

**Example:**
```hcl
> timestamp()
2018-05-13T07:44:12Z
```

## Hash and Crypto Functions

Generate hashes and cryptographic strings for security and data integrity.

### Available Hash Functions:
- `base64sha256` - Base64-encoded SHA256 hash
- `base64sha512` - Base64-encoded SHA512 hash
- `bcrypt` - Bcrypt hash (for passwords)
- `filebase64sha256` - Base64-encoded SHA256 hash of file contents
- `filebase64sha512` - Base64-encoded SHA512 hash of file contents
- `filemd5` - MD5 hash of file contents
- `filesha1` - SHA1 hash of file contents
- `filesha256` - SHA256 hash of file contents
- `filesha512` - SHA512 hash of file contents
- `md5` - MD5 hash
- `rsadecrypt` - RSA decryption
- `sha1` - SHA1 hash
- `sha256` - SHA256 hash
- `sha512` - SHA512 hash
- `uuid` - Generate UUID
- `uuidv5` - Generate UUIDv5

**Example:**
```hcl
> bcrypt("hello world")
$2a$10$D5grTTzcsqyvAeIAnY/mYOIqliCoG7eAMX0/oFcuD.iErkksEbcA
```

## IP Network Functions

### `cidrhost()`
Calculates a full host IP address for a given host number within a given IP network address prefix.

**Syntax:** `cidrhost(prefix, hostnumber)`

**Examples:**
```hcl
> cidrhost("10.12.127.0/20", 16)
10.12.112.16

> cidrhost("10.12.127.0/20", 268)
10.12.113.12

> cidrhost("fd00:fd12:3456:7890:00a2::/72", 34)
fd00:fd12:3456:7890::22
```

### `cidrnetmask()`
Converts an IPv4 address prefix given in CIDR notation into a subnet mask address.

**Syntax:** `cidrnetmask(prefix)`

**Example:**
```hcl
> cidrnetmask("172.16.0.0/12")
255.240.0.0
```

### `cidrsubnet()`
Calculates a subnet address within a given IP network address prefix.

**Syntax:** `cidrsubnet(prefix, newbits, netnum)`

**Examples:**
```hcl
> cidrsubnet("172.16.0.0/12", 4, 2)
172.18.0.0/16

> cidrsubnet("10.1.2.0/24", 4, 15)
10.1.2.240/28

> cidrsubnet("fd00:fd12:3456:7890::/56", 16, 162)
fd00:fd12:3456:7800:a200::/72
```

### `cidrsubnets()`
Calculates a sequence of consecutive IP address ranges within a particular CIDR prefix.

**Syntax:** `cidrsubnets(prefix, newbits...)`

**Example:**
```hcl
> cidrsubnets("10.1.0.0/16", 4, 4, 8, 4)
[
  "10.1.0.0/20",
  "10.1.16.0/20",
  "10.1.32.0/24",
  "10.1.48.0/20",
]
```

## Type Conversion Functions

### `can()`
Evaluates the given expression and returns a boolean value indicating whether the expression produced a result without any errors.

**Syntax:** `can(expression)`

**Example:**
```hcl
> can(local.foo.bar)
true
```

### `defaults()`
A specialized function intended for use with input variables whose type constraints are object types or collections of object types that include optional attributes.

### `nonsensitive()`
Takes a sensitive value and returns a copy of that value with the sensitive marking removed, thereby exposing the sensitive value.

**Example:**
```hcl
output "sensitive_example_hash" {
  value = nonsensitive(sha256(var.sensitive_example))
}
```

### `sensitive()`
Takes any value and returns a copy of it marked so that Terraform will treat it as sensitive, with the same meaning and behavior as for sensitive input variables.

**Example:**
```hcl
locals {
  sensitive_content = sensitive(file("${path.module}/sensitive.txt"))
}
```

### Type Conversion Functions

#### `tobool()`
Converts its argument to a boolean value.

**Example:**
```hcl
> tobool("true")
true
```

#### `tolist()`
Converts its argument to a list value.

**Example:**
```hcl
> tolist(["a", "b", 3])
[
  "a",
  "b",
  "3",
]
```

#### `tomap()`
Converts its argument to a map value.

**Example:**
```hcl
> tomap({"a" = 1, "b" = 2})
{
  "a" = 1
  "b" = 2
}
```

#### `tonumber()`
Converts its argument to a number value.

**Example:**
```hcl
> tonumber("1")
1
```

#### `toset()`
Converts its argument to a set value.

**Example:**
```hcl
> toset(["a", "b", "c"])
[
  "a",
  "b",
  "c",
]
```

#### `tostring()`
Converts its argument to a string value.

**Example:**
```hcl
> tostring(true)
"true"
```

#### `try()`
Evaluates all of its argument expressions in turn and returns the result of the first one that does not produce any errors.

**Example:**
```hcl
locals {
  example = try(
    tostring(var.example),
    tolist(var.example),
  )
}
```
































