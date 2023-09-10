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
require_relative 'modules/creators/ref_item_link_creators'

# Input
require_relative 'modules/input/data_fetchers'
require_relative 'modules/input/input_validators'

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
require_relative 'modules/ui/ui_beautifiers'
require_relative 'modules/ui/user_feedback'

class App
  include ItemCreators
  include ObjectCreators
  include RefItemLinkCreators
  include DataFetchers
  include InputValidators
  include ItemDataLoaders
  include RefDataLoaders
  include AppLogic
  include OptionsRouter
  include OptionsDisplay
  include DataPresenters
  include ItemPresenters
  include ItemDataSavers
  include RefDataSavers
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

  def quit
    puts "\nSaving data and quitting..."
    store_items
    store_refs
    puts 'Thank you for using the App! Have a nice time!'
  end
end
