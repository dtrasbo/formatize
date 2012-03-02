Formatize
=========

As of version 3, Rails doesn't have the `textilize`,
`textilize_without_paragraph`, and `markdown` helper methods. Formatize brings
them back. Drop it into the old application you're upgrading and it'll smoothen
the process just that little bit more.

[![Build status badge](https://secure.travis-ci.org/dtrasbo/formatize.png)](http://travis-ci.org/dtrasbo/formatize)

Installation
------------

Put `gem 'formatize'` into your Gemfile and do a `bundle install`, and that's
it. Formatize depends on `RedCloth` and `bluecloth` so you will not have to
worry about those.

Usage
-----

### The `textilize` & `textilize_without_paragraph` helper methods

The `textilize` helper method accepts a string of
[Textile](http://redcloth.org/textile) and one or more flags. Often, the
default behavior will be suitable and you will not have to pass it any flags:

    textilize("*This is Textile!*  Rejoice!")
    # => "<p><strong>This is Textile!</strong>  Rejoice!</p>"

When necessary, flags are listed as such:

    textilize("(snip)", :flag1, :flag2, :flag3)
    # => "(snip)"

[The `RedCloth` documentation](http://redcloth.rubyforge.org/classes/RedCloth/TextileDoc.html)
lists the available flags. The `textilize_without_paragraps` method
delegates to `textilize` but strips the surrounding `<p>` tags.

### The `markdown` helper method

The `markdown` helper method accepts a string of
[Markdown](http://daringfireball.net/projects/markdown/) and one or more
flags. Often, the default behavior will be suitable and you will not have
to pass it any flags:

    markdown("We are using __Markdown__ now!")
    # => "<p>We are using <strong>Markdown</strong> now!</p>"

When necessary, flags are listed as such:

    markdown("(snip)", :flag1, :flag2, :flag3)
    # => "(snip)"

[The `bluecloth` documentation](http://rubydoc.info/gems/bluecloth/BlueCloth)
lists the available flags.

Sanitization
------------

Both `textilize` and `markdown` sanitizes the input using Rails'
`sanitize` prior to parsing. Since both gems can do this themselves,
it's useful to be able to bypass the pre-parsing sanitization. Two ways:

1. Pass a string that has been marked HTML safe. (Preferred).
2. Use the special `:safe` flag, which is not passed on to the parser.
   _(Deprecated in 1.1, removed in 2.0)._ 

Compatibility
-------------

Feel free to try other versions. Minor patches to support other versions
are welcome.

### Ruby versions
* 1.9.3-p125
* 1.8.7-p358

Latest versions in the 1.8 and 1.9 series. Generally, Formatize will not
jump through hoops to support other versions. 1.8 support may be dropped
eventually.

### Rails versions
* 3.2.2
* 3.1.4
* 3.0.12

The latest versions in all the 3.0 series. This is likely to change when
4.0 is released.

Dependencies
------------

* `RedCloth` gem
* `bluecloth` gem

[![Dependency status badge](https://gemnasium.com/dtrasbo/formatize.png)](https://gemnasium.com/dtrasbo/formatize)

Copyright & Licensing
---------------------

Copyright (c) 2012 David Trasbo

Released under the MIT License. See LICENSE for details.

