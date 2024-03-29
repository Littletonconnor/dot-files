# Docs

## httpie

- Docs: https://httpie.io/docs/cli

### Basic Examples

```bash
http https://www.google.com

# Comes with https as well that can omit the scheme.
https www.google.com

# The METHOD argument is optional, and when you don’t specify it, HTTPie defaults to:
#   - GET for requests without body
#   - POST for requests with body
# Here we don’t specify any request data, so both commands will send the same GET request:
http pie.dev/post hello=world

# Curl headers
http --follow --headers wealthfront.com
```

### Headers

To set custom headers you can use the Header:Value notation:

```bash
http pie.dev/headers User-Agent:Bacon/1.0 'Cookie:valued-visitor=yes;foo=bar' \
    X-Foo:Bar Referer:https://httpie.org/
```

### Query String

If you find yourself manually constructing URLs with querystring parameters on the terminal, you may appreciate the param==value syntax for appending URL parameters.

With that, you don’t have to worry about escaping the & separators for your shell.

```bash
    http https://api.github.com/search/repositories q==httpie per_page==1
```

### Shortcuts for localhost

:3000 expands to http://localhost:3000

```bash
# http://localhost:3000/foo
http :3000/foo
```

### Redirects

If you wish to see the intermediary requests/responses, then use the --all option:

```bash
http --follow --all pie.dev/redirect/3
```

## JQ

- Docs: https://jqlang.github.io/jq/manual/

  JQ is a powerful command-line JSON processor. It's commonly used to parse and manipulate JSON data in the terminal. Here are some examples of how you can use JQ:

```bash
# Selecting fields
cat data.json | jq '.name'

# Filtering by Condition:
cat data.json | jq '.[] | select(.age > 25)'


# Iterating Over Arrays:
cat data.json | jq '.friends[]'

# Combining Operations:
cat data.json | jq '.[] | select(.age > 25) | .name'

# Pretty Printing:
cat data.json | jq '. | {name, age}
```
