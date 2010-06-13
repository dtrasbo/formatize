Formatize
=========

The `textilize`, `textilize_without_paragraph`, and `markdown` helper methods
will not be available from the next version of Rails 3 and on. Formatize
brings them back. They were removed in
[this commit.](http://github.com/rails/rails/commit/0919c0dbca3df02f5cfff7dde4f61b85ef16d886)
If you are running edge Rails, Formatize can already be useful now.

Installation
------------

To install as a gem (recommended), add this to the Gemfile of the application
and run `bundle install`:

    gem 'formatize'

Alternatively, you can install as a plugin:

    rails plugin install git://github.com/dtrasbo/formatize.git

Don't forget to add the `RedCloth` and/or `bluecloth` gems to the Gemfile if
you go with the plugin. They will be installed
automatically when installing the gem.

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

There will be maintained compatibility with the latest final Ruby 1.8 and 1.9
versions, which at the time of writing means 1.8.7 and 1.9.1 respectively. When
Ruby 1.8.8 is released, for example, there will not be made an effort to
maintain backwards compatibility with 1.8.7. Formatize is also compatible with
Ruby 1.9.2 Preview 3.

The `textilize`, `textilize_without_paragraph`, and `markdown` helper methods
were removed after the release of Rails 3.0.0 Beta 4, so when the next
prerelease of Rails 3.0.0 is out, Formatize will be updated (if necessary) to
be compatible with that. However, there will not be made an effort to maintain
backwards compatibility with prereleases of Rails 3.0.0 in the future. As soon
as Rails 3.0.0 Final is released Formatize 1.0.0 Final will be released, and
all future Formatize versions will maintain compatibility with the latest Rails
3.x versions.

What that means is that when Rails 3.0.1 is released there will not be made an
effort to maintain backwards compatibility with 3.0.0, because 3.0.1 is the
latest 3.0 version. The reason for that is that it should be fairly straight
forward to upgrade from, for example, Rails 3.0.0 to 3.0.1, but it might not be
as easy to upgrade from 3.0.5 to 3.1.0.

If one day a new Ruby/Rails version is released and there is no sensible way to
maintain the level of backwards compatibility promised above, a new major
version of Formatize will be released. If Formatize 2 is released one day,
Formatize 1 will be maintained in a separate branch.

Copyright & Licensing
---------------------

Copyright (c) 2010 David Heinemeier Hansson

Released under the MIT License. See LICENSE for details.