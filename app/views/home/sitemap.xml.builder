xml.instruct!
xml.urlset 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url do
    xml.loc root_url(only_path: false)
    xml.changefreq 'monthly'
    xml.priority 1
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc projects_url(only_path: false)
    xml.changefreq 'monthly'
    xml.priority 0.9
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc games_url(only_path: false)
    xml.changefreq 'monthly'
    xml.priority 0.9
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc travels_url(only_path: false)
    xml.changefreq 'monthly'
    xml.priority 0.9
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc I18n.t('header.github_url')
    xml.changefreq 'monthly'
    xml.priority 0.8
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc I18n.t('header.linkedin_url')
    xml.changefreq 'monthly'
    xml.priority 0.8
    xml.lastmod Date.today.to_s
  end
end
