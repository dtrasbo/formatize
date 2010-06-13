require 'test_helper'

class FormatizeHelperTest < ActionView::TestCase
  tests Formatize::Helper

  def test_action_view_includes_formatize
    assert ActionView::Base.include?(Formatize::Helper)
  end

  def test_textilize_should_be_html_safe
    assert textilize("*This is Textile!*  Rejoice!").html_safe?
  end

  def test_textilize
    assert_equal("<p><strong>This is Textile!</strong>  Rejoice!</p>", textilize("*This is Textile!*  Rejoice!"))
  end

  def test_textilize_with_blank
    assert_equal("", textilize(""))
  end

  def test_textilize_with_options
    assert_equal("<p>This is worded &lt;strong&gt;strongly&lt;/strong&gt;</p>", textilize("This is worded <strong>strongly</strong>", :filter_html))
  end

  def test_textilize_should_sanitize_unsafe_input
    assert_equal("<p>This is worded <strong>strongly</strong></p>", textilize("This is worded <strong>strongly</strong><script>code!</script>"))
  end

  def test_textilize_should_not_sanitize_input_if_safe_option
    assert_equal("<p>This is worded <strong>strongly</strong><script>code!</script></p>", textilize("This is worded <strong>strongly</strong><script>code!</script>", :safe))
  end

  def test_textilize_should_not_sanitize_safe_input
    assert_equal("<p>This is worded <strong>strongly</strong><script>code!</script></p>", textilize("This is worded <strong>strongly</strong><script>code!</script>".html_safe))
  end

  def test_textilize_with_hard_breaks
    assert_equal("<p>This is one scary world.<br />\n True.</p>", textilize("This is one scary world.\n True."))
  end

  def test_textilize_without_paragraph_should_be_html_safe
    textilize_without_paragraph("*This is Textile!*  Rejoice!").html_safe?
  end

  def test_textilize_without_paragraph
    assert_equal("<strong>This is Textile!</strong>  Rejoice!", textilize_without_paragraph("*This is Textile!*  Rejoice!"))
  end

  def test_textilize_without_paragraph_with_blank
    assert_equal("", textilize_without_paragraph(""))
  end

  def test_textilize_without_paragraph_with_options
    assert_equal("This is worded &lt;strong&gt;strongly&lt;/strong&gt;", textilize_without_paragraph("This is worded <strong>strongly</strong>", :filter_html))
  end

  def test_textilize_without_paragraph_should_sanitize_unsafe_input
    assert_equal("This is worded <strong>strongly</strong>", textilize_without_paragraph("This is worded <strong>strongly</strong><script>code!</script>"))
  end

  def test_textilize_without_paragraph_should_not_sanitize_input_if_safe_option
    assert_equal("This is worded <strong>strongly</strong><script>code!</script>", textilize_without_paragraph("This is worded <strong>strongly</strong><script>code!</script>", :safe))
  end

  def test_textilize_without_paragraph_should_not_sanitize_safe_input
    assert_equal("This is worded <strong>strongly</strong><script>code!</script>", textilize_without_paragraph("This is worded <strong>strongly</strong><script>code!</script>".html_safe))
  end

  def test_textilize_without_paragraph_with_hard_breaks
    assert_equal("This is one scary world.<br />\n True.", textilize_without_paragraph("This is one scary world.\n True."))
  end

  def test_markdown_should_be_html_safe
    assert markdown("We are using __Markdown__ now!").html_safe?
  end

  def test_markdown
    assert_equal("<p>We are using <strong>Markdown</strong> now!</p>", markdown("We are using __Markdown__ now!"))
  end

  def test_markdown_with_blank
    assert_equal("", markdown(""))
  end

  def test_markdown_should_sanitize_unsafe_input
    assert_equal("<p>This is worded <strong>strongly</strong></p>", markdown("This is worded <strong>strongly</strong><script>code!</script>"))
  end

  def test_markdown_should_not_sanitize_input_if_safe_option
    assert_equal("<p>This is worded <strong>strongly</strong><script>code!</script></p>", markdown("This is worded <strong>strongly</strong><script>code!</script>", :safe))
  end

  def test_markdown_should_not_sanitize_safe_input
    assert_equal("<p>This is worded <strong>strongly</strong><script>code!</script></p>", markdown("This is worded <strong>strongly</strong><script>code!</script>".html_safe))
  end

  def test_markdown_with_hard_breaks
    assert_equal("<p>This is one scary world.</p>\n\n<p>True.</p>", markdown("This is one scary world.\n\nTrue."))
  end
end