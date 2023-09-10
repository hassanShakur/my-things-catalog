require 'json'

# Classes
require_relative 'classes/label'
require_relative 'classes/author'
require_relative 'classes/genre'
require_relative 'classes/source'

# Item classes
require_relative 'classes/item/item'
require_relative 'classes/item/book'
require_relative 'classes/item/game'
require_relative 'classes/item/movie'
require_relative 'classes/item/music_album'

# Modules
# Creators
require_relative 'modules/creators/item_creators'
require_relative 'modules/creators/object_creators'

# Loaders
require_relative 'modules/loaders/item_data_loaders'
require_relative 'modules/loaders/ref_data_loaders'

# Logic
require_relative 'modules/logic/app_logic'
require_relative 'modules/logic/options_router'

# Options
require_relative 'modules/options/options_display'

# Presenters
require_relative 'modules/presenters/data_presenters'
require_relative 'modules/presenters/item_presenters'

# Storage
require_relative 'modules/storage/item_data_savers'
require_relative 'modules/storage/ref_data_savers'

# Ui
require_relative 'modules/ui/data_fetchers'
require_relative 'modules/ui/input_validators'
require_relative 'modules/ui/ui_beautifiers'
require_relative 'modules/ui/user_feedback'

class App
  include AppLogic
  include DataFetchers
  include ItemDataLoaders
  include RefDataLoaders
  include DataPresenters
  include ItemDataSavers
  include RefDataSavers
  include InputValidators
  include ItemCreators
  include ItemPresenters
  include ObjectCreators
  include OptionsDisplay
  include OptionsRouter
  include UIBeautifiers
  include UserFeedback

  def initialize
    @books = []
    @games = []
    @movies = []
    @genres = []
    @labels = []
    @sources = []
    @authors = []
    @music_albums = []

    @authors_items_hash = []
    @sources_items_hash = []
    @labels_items_hash = []
    @genres_items_hash = []
  end

  def run
    puts "Welcome to School library App!\n"
    load_refs
    load_items
    load_refs_items_list
  end
end
