Formatize
=========

Plugin containing the `textilize`, `textilize_without_paragraph`, and
`markdown` helper methods removed from Rails.

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

Copyright & Licensing
---------------------

Copyright (c) 2010 David Heinemeier Hansson

Released under the MIT License. See LICENSE for details.