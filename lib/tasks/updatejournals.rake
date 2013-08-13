require 'nokogiri'
require 'open-uri'

desc "Update CTSM database with old CTSM publications data"
task update_publications: :environment do

  journals = {
    name: 'Journals',
    url: 'http://ctsm.umd.edu/index.php?option=com_content&view=article&id=32&Itemid=33' }
  conferences = {
    name: 'Conferences',
    url: 'http://ctsm.umd.edu/index.php?option=com_content&view=article&id=31&Itemid=34' }
  textbooks = {
    name: 'Textbooks',
    url: 'http://ctsm.umd.edu/index.php?option=com_content&view=article&id=35&Itemid=32' }
  technical_reports = {
    name: 'Technical Reports',
    url: 'http://ctsm.umd.edu/index.php?option=com_content&view=article&id=34&Itemid=35' }


  def update_publication(category)
    puts '*** Updating ' + category[:name] + ' ***'

    publications_doc = Nokogiri::HTML(open(category[:url]))

    #grab all table data
    rows = publications_doc.css('.small>table>tr>td')

    #toggle title selector
    title_selector = 'div[2]/text()'
    if category[:name] == 'Textbooks'
      title_selector = 'div[2]/i/text()'
    end

    #extract information
    details = rows.collect do |row|
      detail = {}
      [
        [:authors, 'div[1]/text()'],
        [:title, title_selector],
        [:content, 'div[3]/text()']
      ].each do |name, xpath|
        detail[name] = row.at_xpath(xpath).to_s.strip
      end
      detail
    end

    details.each do |detail|
      if (detail[:title] != "")
      publication = Refinery::Publications::Publication.new

      publication.authors = detail[:authors]
      publication.title = detail[:title]
      publication.content = detail[:content]
      publication.category = category[:name]

      publication.save
      puts 'publication created!'
      else
        puts 'empty entry, ignoring....'
      end
    end

  end

  update_publication(journals)
  update_publication(textbooks)
  update_publication(conferences)
  update_publication(technical_reports)
end
