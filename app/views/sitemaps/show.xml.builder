base_url = "http://#{request.host_with_port}"
xml.instruct! :xml, :version=> '1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url {
    xml.loc("http://www.lasposa.kiev.ua/")
    xml.priority(1)
    xml.changefreq("d
  }
  @types.each do |type|
    xml.url {
      xml.loc("http://www.lasposa.kiev.ua/#{type.alias.to_s}/all")
      xml.priority(0.9)
      xml.changefreq("daily")
    }
  end
  @pages.each do |page|
    xml.url {
      xml.loc("http://www.lasposa.kiev.ua/#{page.alias.to_s}")
      xml.priority(0.8)
      xml.changefreq("daily")
    }
  end
end