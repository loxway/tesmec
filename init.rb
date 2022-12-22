Redmine::Plugin.register :tesmec do
  name 'Tesmec plugin'
  author 'Alessandro Maggi'
  description 'Plugin to manage all tesmec stuff'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  menu :project_menu,
       :tesmec,
       { controller: 'tesmec', action: 'index' },
       caption: 'Tesmec Plugin',
       param: :project_id
  permission :index_tesmec, tesmec: :index
  permission :createrepo_tesmec, tesmec: :newrepo
  permission :viewrepo_tesmec, tesmec: :viewrepo
  permission :trackrepo_tesmec, tesmec: :trackrepo
end
