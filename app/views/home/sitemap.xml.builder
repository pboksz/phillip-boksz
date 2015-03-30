xml.instruct!
xml.urlset 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url do
    xml.loc root_url
    xml.changefreq 'monthly'
    xml.priority 1
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc projects_url
    xml.changefreq 'monthly'
    xml.priority 0.9
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc games_url
    xml.changefreq 'monthly'
    xml.priority 0.9
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc travels_url
    xml.changefreq 'monthly'
    xml.priority 0.9
    xml.lastmod Date.today.to_s
  end
end
