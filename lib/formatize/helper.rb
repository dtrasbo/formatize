module Formatize
  module Helper
    # Returns the text with all the Textile[http://www.textism.com/tools/textile] codes turned into HTML tags.
    #
    # You can learn more about Textile's syntax at its website[http://www.textism.com/tools/textile].
    # <i>This method is only available if RedCloth[http://redcloth.org/] is available</i>.
    #
    # ==== Examples
    #   textilize("*This is Textile!*  Rejoice!")
    #   # => "<p><strong>This is Textile!</strong>  Rejoice!</p>"
    #
    #   textilize("I _love_ ROR(Ruby on Rails)!")
    #   # => "<p>I <em>love</em> <acronym title="Ruby on Rails">ROR</acronym>!</p>"
    #
    #   textilize("h2. Textile makes markup -easy- simple!")
    #   # => "<h2>Textile makes markup <del>easy</del> simple!</h2>"
    #
    #   textilize("Visit the Rails website "here":http://www.rubyonrails.org/.)
    #   # => "<p>Visit the Rails website <a href="http://www.rubyonrails.org/">here</a>.</p>"
    #
    #   textilize("This is worded <strong>strongly</strong>")
    #   # => "<p>This is worded <strong>strongly</strong></p>"
    #
    #   textilize("This is worded <strong>strongly</strong>", :filter_html)
    #   # => "<p>This is worded &lt;strong&gt;strongly&lt;/strong&gt;</p>"
    #
    def textilize(text, *options)
      require 'RedCloth'

      options ||= [:hard_breaks]
      text = sanitize(text) unless text.html_safe? || options.delete(:safe)

      if text.blank?
        ""
      else
        textilized = RedCloth.new(text, options)
        textilized.to_html
      end.html_safe
    end

    # Returns the text with all the Textile codes turned into HTML tags,
    # but without the bounding <p> tag that RedCloth adds.
    #
    # You can learn more about Textile's syntax at its website[http://www.textism.com/tools/textile].
    # <i>This method is only available if RedCloth[http://redcloth.org/] is available</i>.
    #
    # ==== Examples
    #   textilize_without_paragraph("*This is Textile!*  Rejoice!")
    #   # => "<strong>This is Textile!</strong>  Rejoice!"
    #
    #   textilize_without_paragraph("I _love_ ROR(Ruby on Rails)!")
    #   # => "I <em>love</em> <acronym title="Ruby on Rails">ROR</acronym>!"
    #
    #   textilize_without_paragraph("h2. Textile makes markup -easy- simple!")
    #   # => "<h2>Textile makes markup <del>easy</del> simple!</h2>"
    #
    #   textilize_without_paragraph("Visit the Rails website "here":http://www.rubyonrails.org/.)
    #   # => "Visit the Rails website <a href="http://www.rubyonrails.org/">here</a>."
    def textilize_without_paragraph(text, *options)
      require 'RedCloth'

      textiled = textilize(text, *options)
      if textiled[0..2] == "<p>" then textiled = textiled[3..-1] end
      if textiled[-4..-1] == "</p>" then textiled = textiled[0..-5] end
      return textiled
    end

    # Returns the text with all the Markdown codes turned into HTML tags.
    # <i>This method requires BlueCloth[http://www.deveiate.org/projects/BlueCloth]
    # to be available</i>.
    #
    # ==== Examples
    #   markdown("We are using __Markdown__ now!")
    #   # => "<p>We are using <strong>Markdown</strong> now!</p>"
    #
    #   markdown("We like to _write_ `code`, not just _read_ it!")
    #   # => "<p>We like to <em>write</em> <code>code</code>, not just <em>read</em> it!</p>"
    #
    #   markdown("The [Markdown website](http://daringfireball.net/projects/markdown/) has more information.")
    #   # => "<p>The <a href="http://daringfireball.net/projects/markdown/">Markdown website</a>
    #   #     has more information.</p>"
    #
    #   markdown('![The ROR logo](http://rubyonrails.com/images/rails.png "Ruby on Rails")')
    #   # => '<p><img src="http://rubyonrails.com/images/rails.png" alt="The ROR logo" title="Ruby on Rails" /></p>'
    def markdown(text, *options)
      require 'bluecloth'

      text = sanitize(text) unless text.html_safe? || options.delete(:safe)
      (text.blank? ? "" : BlueCloth.new(text).to_html).html_safe
    end
  end
end