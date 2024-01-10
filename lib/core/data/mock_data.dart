const sourceId = 'bbc-news';
const sourceName = 'BBC News';
const articleTitle =
    'HotSat-1: Novel UK spacecraft maps heat variations across Earth';
const articleDescription =
    "A new British satellite is showing the world's hot and cold spots in extremely fine detail.";
const articleContent =
    'A novel UK satellite has returned its first pictures of heat variations across the surface of the Earth.\r\nHotS… [+3965 chars]';

const Map<String, dynamic> getTopArticlesBySourceResponse = {
  'status': 'ok',
  'totalResults': 10,
  'articles': [
    {
      'source': {'id': 'bbc-news', 'name': 'BBC News'},
      'author': 'BBC News',
      'title': "Philippines 'Jesus' drag queen arrested for obscenity",
      'description':
          "Pura Luka Vega, 33, faces up to 12 years in jail under the Catholic-majority country's laws.",
      'url': 'http://www.bbc.co.uk/news/world-asia-67025750',
      'urlToImage':
          'https://ichef.bbci.co.uk/news/1024/branded_news/CB56/production/_131345025_gettyimages-1705182138.jpg',
      'publishedAt': '2023-10-06T06:37:24.7067139Z',
      'content':
          "A Philippines drag queen was arrested on Wednesday over their performance as Jesus Christ reciting the Lord's Prayer.\r\nA video of the performance by Pura Luka Vega had sparked criminal complaints by … [+2228 chars]"
    },
    {
      'source': {'id': 'bbc-news', 'name': 'BBC News'},
      'author': 'BBC News',
      'title':
          'Syria war: At least 100 dead in drone attack on cadet graduation ceremony',
      'description':
          "The military says 'terrorist' drones targeted the event at a military academy near the city of Homs.",
      'url': 'http://www.bbc.co.uk/news/world-middle-east-67017010',
      'urlToImage':
          'https://ichef.bbci.co.uk/news/1024/branded_news/CE58/production/_131342825_index_syria_drone_attack_reuters.jpg',
      'publishedAt': '2023-10-06T06:37:24.1443536Z',
      'content':
          "A drone attack on a Syrian military academy in the city of Homs has killed at least 100 people and left dozens injured.\r\nThe explosive-laden drones targeted a graduation ceremony attended by cadets' … [+3226 chars]"
    },
    {
      'source': {'id': 'bbc-news', 'name': 'BBC News'},
      'author': 'BBC News',
      'title': 'BBC witnesses Chinese ships blocking Philippines supply boats',
      'description':
          'It resulted in a standoff that lasted several hours before the Philippine ships turned back.',
      'url': 'http://www.bbc.co.uk/news/world-asia-67015857',
      'urlToImage':
          'https://ichef.bbci.co.uk/news/1024/branded_news/0036/production/_131345000_vsr07291-1.jpg',
      'publishedAt': '2023-10-06T06:37:23.1806346Z',
      'content':
          'Media caption, Watch: Formation of Chinese ships blocks Philippine boats\r\nThe BBC has witnessed Chinese vessels blocking Filipino supply boats to an outpost in the South China Sea.\r\nThe incident took… [+3178 chars]'
    },
    {
      'source': {'id': 'bbc-news', 'name': 'BBC News'},
      'author': 'BBC News',
      'title':
          'HotSat-1: Novel UK spacecraft maps heat variations across Earth',
      'description':
          "A new British satellite is showing the world's hot and cold spots in extremely fine detail.",
      'url': 'http://www.bbc.co.uk/news/science-environment-67010377',
      'urlToImage':
          'https://ichef.bbci.co.uk/news/1024/branded_news/F004/production/_131344416_3_las_vegas.jpg',
      'publishedAt': '2023-10-06T06:37:21.5657967Z',
      'content':
          'Media caption, Watch: The heat of a Chicago locomotive is detected by HotSat-1 at night\r\nA novel UK satellite has returned its first pictures of heat variations across the surface of the Earth.\r\nHotS… [+3965 chars]'
    },
    {
      'source': {'id': 'bbc-news', 'name': 'BBC News'},
      'author': 'BBC News',
      'title': 'Taylor Swift tour film tops \$100m in advance ticket sales',
      'description':
          'The film of the Eras tour is due to be released in cinemas in more than 100 countries next Friday.',
      'url': 'http://www.bbc.co.uk/news/business-67025651',
      'urlToImage':
          'https://ichef.bbci.co.uk/news/1024/branded_news/6C60/production/_131344772_gettyimages-1636796802.jpg',
      'publishedAt': '2023-10-06T06:37:18.9570708Z',
      'content':
          "Taylor Swift's Eras Tour concert film has become a box office blockbuster a week before hitting cinemas.\r\nIts distributor AMC says global advance ticket sales have topped \$100m (£82m), adding demand … [+1747 chars]"
    },
    {
      'source': {'id': 'bbc-news', 'name': 'BBC News'},
      'author': 'BBC News',
      'title':
          'Ukraine war: ‘Every family’ in Hroza village affected by missile attack',
      'description':
          'At least 51 people were killed in a strike during a wake in the eastern village of Hroza on Thursday.',
      'url': 'http://www.bbc.co.uk/news/world-europe-67025706',
      'urlToImage':
          'https://ichef.bbci.co.uk/news/1024/branded_news/8F88/production/_131344763_336d3fc13c962e1b6160ebf8cc7622a1a473a4c90_0_5472_36481000x667.jpg',
      'publishedAt': '2023-10-06T04:07:18.4725822Z',
      'content':
          "People from \"every family\" in the Ukrainian village of Hroza have been affected by a missile attack that killed 51 people, Ukraine's interior minister has said.\r\nAt least 51 people were killed when t… [+3147 chars]"
    },
    {
      'source': {'id': 'bbc-news', 'name': 'BBC News'},
      'author': 'BBC News',
      'title': 'Watch: Sparks sent flying in precarious landing',
      'description':
          'Emergency crews were ready as the plane skidded along the tarmac at Chattanooga Metropolitan Airport.',
      'url': 'http://www.bbc.co.uk/news/world-us-canada-67025726',
      'urlToImage':
          'https://ichef.bbci.co.uk/news/1024/branded_news/58D8/production/_131344722_p0gjspxy.jpg',
      'publishedAt': '2023-10-06T01:52:10.7377235Z',
      'content':
          'Emergency services watched as a FedEx plane skidded across the tarmac at Chattanooga Metropolitan Airport. \r\nThey praised the crew for pulling off the landing and avoiding a disaster. The planes land… [+119 chars]'
    },
    {
      'source': {'id': 'bbc-news', 'name': 'BBC News'},
      'author': 'BBC News',
      'title': 'Biden faces bipartisan attacks over new border wall',
      'description':
          'US officials say they are legally obligated to move ahead with a new section the southern border wall.',
      'url': 'http://www.bbc.co.uk/news/world-us-canada-67024003',
      'urlToImage':
          'https://ichef.bbci.co.uk/news/1024/branded_news/C82C/production/_131344215_gettyimages-1719075321-2.jpg',
      'publishedAt': '2023-10-05T23:52:16.1291071Z',
      'content':
          "President Joe Biden is coming under fire from both sides of the political spectrum after his administration announced new border wall construction in Texas.\r\nMr Biden has claimed he \"can't stop\" cons… [+3700 chars]"
    },
    {
      'source': {'id': 'bbc-news', 'name': 'BBC News'},
      'author': 'BBC News',
      'title': 'Putin makes nuclear-powered Burevestnik missile test claim',
      'description':
          'The Russian leader says testing of a global-range missile was successful, but that is not confirmed.',
      'url': 'http://www.bbc.co.uk/news/world-europe-67021695',
      'urlToImage':
          'https://ichef.bbci.co.uk/news/1024/branded_news/1413A/production/_131343228_tv088439390.jpg',
      'publishedAt': '2023-10-05T20:52:19.9733644Z',
      'content':
          "Russia has held a \"final successful test\" of a nuclear-powered cruise missile, Vladimir Putin has claimed.\r\nThe president's comments came after his spokesman rejected a New York Times report that tes… [+2843 chars]"
    },
    {
      'source': {'id': 'bbc-news', 'name': 'BBC News'},
      'author': 'BBC News',
      'title': 'Trump claims immunity from election interference charges',
      'description':
          "The former president's lawyers claim his baseless statements about alleged fraud were part of official duties.",
      'url': 'http://www.bbc.co.uk/news/world-us-canada-67024517',
      'urlToImage':
          'https://ichef.bbci.co.uk/news/1024/branded_news/8D19/production/_130612163_mediaitem130612162.jpg',
      'publishedAt': '2023-10-05T20:37:16.1451602Z',
      'content':
          'Lawyers for Donald Trump claim that his attempts to cast doubt on the 2020 election fell within his official duties as president and are not subject to criminal prosecution.\r\nThey have asked a judge … [+527 chars]'
    }
  ]
};

const Map<String, dynamic> getSourcesResponse = {
  'status': 'ok',
  'sources': [
    {
      'id': 'abc-news',
      'name': 'ABC News',
      'description':
          'Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.',
      'url': 'https://abcnews.go.com',
      'category': 'general',
      'language': 'en',
      'country': 'us'
    },
    {
      'id': 'abc-news-au',
      'name': 'ABC News (AU)',
      'description':
          "Australia's most trusted source of local, national and world news. Comprehensive, independent, in-depth analysis, the latest business, sport, weather and more.",
      'url': 'http://www.abc.net.au/news',
      'category': 'general',
      'language': 'en',
      'country': 'au'
    },
    {
      'id': 'aftenposten',
      'name': 'Aftenposten',
      'description':
          'Norges ledende nettavis med alltid oppdaterte nyheter innenfor innenriks, utenriks, sport og kultur.',
      'url': 'https://www.aftenposten.no',
      'category': 'general',
      'language': 'no',
      'country': 'no'
    },
    {
      'id': 'al-jazeera-english',
      'name': 'Al Jazeera English',
      'description':
          'News, analysis from the Middle East and worldwide, multimedia and interactives, opinions, documentaries, podcasts, long reads and broadcast schedule.',
      'url': 'http://www.aljazeera.com',
      'category': 'general',
      'language': 'en',
      'country': 'us'
    },
    {
      'id': 'ansa',
      'name': 'ANSA.it',
      'description':
          'Agenzia ANSA: ultime notizie, foto, video e approfondimenti su: cronaca, politica, economia, regioni, mondo, sport, calcio, cultura e tecnologia.',
      'url': 'http://www.ansa.it',
      'category': 'general',
      'language': 'it',
      'country': 'it'
    },
    {
      'id': 'argaam',
      'name': 'Argaam',
      'description':
          'ارقام موقع متخصص في متابعة سوق الأسهم السعودي تداول - تاسي - مع تغطيه معمقة لشركات واسعار ومنتجات البتروكيماويات , تقارير مالية الاكتتابات الجديده ',
      'url': 'http://www.argaam.com',
      'category': 'business',
      'language': 'ar',
      'country': 'sa'
    },
    {
      'id': 'ars-technica',
      'name': 'Ars Technica',
      'description':
          "The PC enthusiast's resource. Power users and the tools they love, without computing religion.",
      'url': 'http://arstechnica.com',
      'category': 'technology',
      'language': 'en',
      'country': 'us'
    },
    {
      'id': 'ary-news',
      'name': 'Ary News',
      'description':
          'ARY News is a Pakistani news channel committed to bring you up-to-the minute Pakistan news and featured stories from around Pakistan and all over the world.',
      'url': 'https://arynews.tv/ud/',
      'category': 'general',
      'language': 'ud',
      'country': 'pk'
    },
    {
      'id': 'associated-press',
      'name': 'Associated Press',
      'description':
          'The AP delivers in-depth coverage on the international, politics, lifestyle, business, and entertainment news.',
      'url': 'https://apnews.com/',
      'category': 'general',
      'language': 'en',
      'country': 'us'
    },
    {
      'id': 'australian-financial-review',
      'name': 'Australian Financial Review',
      'description':
          'The Australian Financial Review reports the latest news from business, finance, investment and politics, updated in real time. It has a reputation for independent, award-winning journalism and is essential reading for the business and investor community.',
      'url': 'http://www.afr.com',
      'category': 'business',
      'language': 'en',
      'country': 'au'
    },
    {
      'id': 'axios',
      'name': 'Axios',
      'description':
          'Axios are a new media company delivering vital, trustworthy news and analysis in the most efficient, illuminating and shareable ways possible.',
      'url': 'https://www.axios.com',
      'category': 'general',
      'language': 'en',
      'country': 'us'
    },
    {
      'id': 'bbc-news',
      'name': 'BBC News',
      'description':
          'Use BBC News for up-to-the-minute news, breaking news, video, audio and feature stories. BBC News provides trusted World and UK news as well as local and regional perspectives. Also entertainment, business, science, technology and health news.',
      'url': 'http://www.bbc.co.uk/news',
      'category': 'general',
      'language': 'en',
      'country': 'gb'
    },
    {
      'id': 'bbc-sport',
      'name': 'BBC Sport',
      'description':
          'The home of BBC Sport online. Includes live sports coverage, breaking news, results, video, audio and analysis on Football, F1, Cricket, Rugby Union, Rugby League, Golf, Tennis and all the main world sports, plus major events such as the Olympic Games.',
      'url': 'http://www.bbc.co.uk/sport',
      'category': 'sports',
      'language': 'en',
      'country': 'gb'
    },
    {
      'id': 'bild',
      'name': 'Bild',
      'description':
          'Die Seite 1 für aktuelle Nachrichten und Themen, Bilder und Videos aus den Bereichen News, Wirtschaft, Politik, Show, Sport, und Promis.',
      'url': 'http://www.bild.de',
      'category': 'general',
      'language': 'de',
      'country': 'de'
    },
    {
      'id': 'blasting-news-br',
      'name': 'Blasting News (BR)',
      'description':
          'Descubra a seção brasileira da Blasting News, a primeira revista feita pelo  público, com notícias globais e vídeos independentes. Junte-se a nós e torne- se um repórter.',
      'url': 'https://br.blastingnews.com',
      'category': 'general',
      'language': 'pt',
      'country': 'br'
    },
    {
      'id': 'bleacher-report',
      'name': 'Bleacher Report',
      'description':
          'Sports journalists and bloggers covering NFL, MLB, NBA, NHL, MMA, college football and basketball, NASCAR, fantasy sports and more. News, photos, mock drafts, game scores, player profiles and more!',
      'url': 'http://www.bleacherreport.com',
      'category': 'sports',
      'language': 'en',
      'country': 'us'
    },
    {
      'id': 'bloomberg',
      'name': 'Bloomberg',
      'description':
          'Bloomberg delivers business and markets news, data, analysis, and video to the world, featuring stories from Businessweek and Bloomberg News.',
      'url': 'http://www.bloomberg.com',
      'category': 'business',
      'language': 'en',
      'country': 'us'
    },
    {
      'id': 'breitbart-news',
      'name': 'Breitbart News',
      'description':
          'Syndicated news and opinion website providing continuously updated headlines to top news and analysis sources.',
      'url': 'http://www.breitbart.com',
      'category': 'general',
      'language': 'en',
      'country': 'us'
    },
    {
      'id': 'business-insider',
      'name': 'Business Insider',
      'description':
          'Business Insider is a fast-growing business site with deep financial, media, tech, and other industry verticals. Launched in 2007, the site is now the largest business news site on the web.',
      'url': 'http://www.businessinsider.com',
      'category': 'business',
      'language': 'en',
      'country': 'us'
    },
    {
      'id': 'business-insider-uk',
      'name': 'Business Insider (UK)',
      'description':
          'Business Insider is a fast-growing business site with deep financial, media, tech, and other industry verticals. Launched in 2007, the site is now the largest business news site on the web.',
      'url': 'http://uk.businessinsider.com',
      'category': 'business',
      'language': 'en',
      'country': 'gb'
    },
    {
      'id': 'buzzfeed',
      'name': 'Buzzfeed',
      'description':
          'BuzzFeed is a cross-platform, global network for news and entertainment that generates seven billion views each month.',
      'url': 'https://www.buzzfeed.com',
      'category': 'entertainment',
      'language': 'en',
      'country': 'us'
    }
  ],
};
