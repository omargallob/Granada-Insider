# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.granadainsider.com"

SitemapGenerator::Sitemap.add_links do |sitemap|
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: sitemap.add path, options
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly', 
  #           :lastmod => Time.now, :host => default_host

  
  # Examples:
  
  # add '/articles'
  # sitemap.add articles_path, :priority => 0.7, :changefreq => 'daily'

  # add all individual articles
  Page.find(:all).each do |a|
    sitemap.add view_page_path(a), :lastmod => a.updated_at
  end

  Classified.find_main.each do |category|
    sitemap.add classified_filter_path(category), :lastmod => category.updated_at
  end
  # add merchant path
  # sitemap.add '/purchase', :priority => 0.7, :host => "https://www.example.com"
  
end
