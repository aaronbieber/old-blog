module Jekyll

  class InfoBox < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      output = paragraphize(super)
      "<div class=\"infobox\">#{output}</div>"
    end

    # Lifted from Blockquote (blockquote.rb) and slightly modified.
    def paragraphize(input)
      "<p>#{input.lstrip.rstrip.gsub(/\n\n/, '</p><p>').gsub(/\n/, '')}</p>"
    end
  end

end

Liquid::Template.register_tag('infobox', Jekyll::InfoBox)
