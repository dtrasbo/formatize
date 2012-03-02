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
[Textile](http://redcloth.org/textile) and one or more options. In most cases
the default behavior will be suitable and you will not have to pass it any options:

    textilize("*This is Textile!*  Rejoice!")
    # => "<p><strong>This is Textile!</strong>  Rejoice!</p>"

Sometimes, however, you want to customize how RedCloth parses your Textile. You
can specify a single option:

    textilize("This is worded <strong>strongly</strong>", :filter_html)
    # => "<p>This is worded &lt;strong&gt;strongly&lt;/strong&gt;</p>"

Or you can specify multiple options:

    textilize("This is worded <strong>strongly</strong>", :filter_html, :lite_mode)
    # => "This is worded &lt;strong&gt;strongly&lt;/strong&gt;"

The `textilize_without_paragraph` works similarly except it omits the
surrounding `<p>` tag. Check out the
[documentation for `RedCloth::TextileDoc`](http://redcloth.rubyforge.org/classes/RedCloth/TextileDoc.html)
for an overview on the options available.

### The `markdown` helper method

The `markdown` helper method accepts a string of
[Markdown](http://daringfireball.net/projects/markdown/):

    markdown("We are using __Markdown__ now!")
    # => "<p>We are using <strong>Markdown</strong> now!</p>"

If you set the `:safe` option to `true` the input string will be not sanitized
before conversion:

    markdown("<em>We are using __Markdown__ now!</em>", :safe => true)
    # => "<p><em>We are using <strong>Markdown</strong> now!</em></p>"

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

