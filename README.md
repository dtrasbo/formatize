Formatize
=========

As of version 3, Rails doesn't have the `textilize`,
`textilize_without_paragraph`, and `markdown` helper methods. Formatize brings
them back. Drop it into the old application you're upgrading and it'll smoothen
the process just that little bit more.

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

I'll maintain compatibility with the latest Ruby 1.8 and 1.9 versions, which
for the moment being means Ruby 1.8.7 and 1.9.2. It might work with others but
it's not guaranteed. Patches welcome.

As for Rails, I'll make sure Formatize works with the latest 3.x versions,
which for the moment being just means Rails 3.0.0. If, say, the latest 3.0
version was 3.0.5 and the latest 3.1 version was 3.1.1, Formatize would work
with both.

Copyright & Licensing
---------------------

Copyright (c) 2010 David Trasbo

Released under the MIT License. See LICENSE for details.