module Formatize
  module Helper
    # Accepts a string of [Textile](http://redcloth.org/textile) and one or
    # more flags. Often, the default behavior will be suitable and you will not
    # have to pass it any flags:
    #
    #   textilize("*This is Textile!*  Rejoice!")
    #   # => "<p><strong>This is Textile!</strong>  Rejoice!</p>"
    #
    # When necessary, flags are listed as such:
    #
    #   textilize("(snip)", :flag1, :flag2, :flag3)
    #   # => "(snip)"
    #
    # [The +RedCloth+ documentation](http://redcloth.rubyforge.org/classes/RedCloth/TextileDoc.html)
    # lists the available flags.
    #
    # It sanitizes the input using Rails' +sanitize+ prior to parsing.
    # There are two ways to bypass pre-parsing sanitization: 
    #
    # 1. Pass a string that has been marked HTML safe. (Preferred).
    # 2. Use the special <tt>:safe</tt> flag, which is not passed on to the
    #    parser. _(Deprecated in 1.1, removed in 2.0)._
    #
    def textilize(text, *flags)
      require 'RedCloth'

      if safe = flags.delete(:safe)
        ActiveSupport::Deprecation.warn('The :safe flag is deprecated. Mark the input HTML safe instead.')
      end

      text = sanitize(text) unless text.html_safe? || safe

      if text.blank?
        ""
      else
        RedCloth.new(text, flags).to_html
      end.html_safe
    end

    # Delegates to +textilize+ but strips the surrounding <tt><p></tt>
    # tags.
    #
    def textilize_without_paragraph(text, *flags)
      textiled = textilize(text, *flags)
      if textiled[0..2] == "<p>" then textiled = textiled[3..-1] end
      if textiled[-4..-1] == "</p>" then textiled = textiled[0..-5] end
      return textiled
    end

    # Accepts a string of [Markdown](http://daringfireball.net/projects/markdown/)
    # and one or more flags. Often, the default behavior will be suitable and
    # you will not have to pass it any flags:
    #
    #   markdown("We are using __Markdown__ now!")
    #   # => "<p>We are using <strong>Markdown</strong> now!</p>"
    #
    # When necessary, flags are listed as such:
    #
    #   markdown("(snip)", :flag1, :flag2, :flag3)
    #   # => "(snip)"
    #
    # [The +bluecloth+ documentation](http://rubydoc.info/gems/bluecloth/BlueCloth)
    # lists the available flags.
    #
    # It sanitizes the input using Rails' +sanitize+ prior to parsing.
    # There are two ways to bypass pre-parsing sanitization: 
    #
    # 1. Pass a string that has been marked HTML safe. (Preferred).
    # 2. Use the special <tt>:safe</tt> flag, which is not passed on to the
    #    parser. _(Deprecated in 1.1, removed in 2.0)._
    #
    def markdown(text, *flags)
      require 'bluecloth'

      if safe = flags.delete(:safe)
        ActiveSupport::Deprecation.warn('The :safe flag is deprecated. Mark the input HTML safe instead.')
      end

      text = sanitize(text) unless text.html_safe? || safe

      if text.blank?
        ""
      else
        flags_hash = {}
        flags.each do |flag|
          flags_hash[flag] = true
        end

        BlueCloth.new(text, flags_hash).to_html
      end.html_safe
    end
  end
end

