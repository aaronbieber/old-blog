module Jekyll
  class PostComparer
    attr_accessor :date, :slug

    def initialize(name)
      url_stem, date, slug = *name.match(/^(?:.+\/)*(\d+-\d+-\d+)-(.*)$/)
      @slug = slug
      @date = Time.parse(date)
    end
    
    # Octopress creates dates with hours and crap in them which are not in the file name
    # so just compare based on the date parts
    def ==(post)
      cmp = self.date.strftime('%Y-%m-%d') <=> post.date.strftime('%Y-%m-%d')
      if 0 == cmp
       cmp = self.slug <=> post.slug
      end
      return 0 == cmp
    end
  end

  class PostUrl < Liquid::Tag
    def initialize(tag_name, post, tokens)
      super
      @orig_post = post.strip
      @post = PostComparer.new(@orig_post)
    end

    def render(context)
      site = context.registers[:site]
      
      site.posts.each do |p|
        if @post == p
          return p.url
        end
      end

      puts "ERROR: post_url: \"#{@orig_post}\" could not be found"

      return "#"
    end
  end
end

Liquid::Template.register_tag('post_url', Jekyll::PostUrl)
