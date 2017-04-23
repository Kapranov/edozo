if Rails.env.development?

  # Album.destroy_all
  # Photo.destroy_all
  # Project.destroy_all
  # Task.destroy_all
  # Category.destroy_all
  # Product.destroy_all
  # Article.destroy_all
  # Event.destroy_all
  # Item.destroy_all
  # ItemReview.destroy_all
  # Food.destroy_all
  # Post.destroy_all
  # Member.destroy_all
  # Fruit.destroy_all
  # Google.destroy_all
  # Visit.destroy_all
  # Sporter.destroy_all
  # Competition.destroy_all
  # CompetitionResult.destroy_all
  # Track.destory_all
  # ClickTrack.destory_all
  # Good.destory_all
  # Tick.destory_all
  # Tack.destory_all
  # Fantastic.destory_all
  # Atom.destory_all
  # Book.destory_all
  # Review.destory_all

  # Location.destroy_all
  # Download.destroy_all
  # Country.destroy_all
  # State.destroy_all

  puts "--------Creating Album------------------------------------------------"
  album = CreateAlbumService.new.call
  puts 'CREATED   Total  Albums:              ' << "#{Album.count}"
  puts "--------Creating Photo------------------------------------------------"
  photo = CreatePhotoService.new.call
  puts 'CREATED   Total  Photos:              ' << "#{Photo.count}"
  puts "--------Creating Project----------------------------------------------"
  project = CreateProjectService.new.call
  puts 'CREATED   Total  Projects:            ' << "#{Project.count}"
  puts "--------Creating Task-------------------------------------------------"
  task = CreateTaskService.new.call
  puts 'CREATED   Total  Tasks:               ' << "#{Task.count}"
  puts "--------Creating Category---------------------------------------------"
  category = CreateCategoryService.new.call
  puts 'CREATED   Total  Categories:          ' << "#{Category.count}"
  puts "--------Creating Product----------------------------------------------"
  product = CreateProductService.new.call
  puts 'CREATED   Total  Products:            ' << "#{Product.count}"
  puts "--------Creating Location---------------------------------------------"
  location = CreateLocationService.new.call
  puts 'CREATED   Total  Locations:           ' << "#{Location.count}"
  puts "--------Creating Download---------------------------------------------"
  download = CreateDownloadService.new.call
  puts 'CREATED   Total  Downloads:           ' << "#{Download.count}"
  puts "--------Creating Countries--------------------------------------------"
  country = CreateCountryService.new.call
  puts 'CREATED   Total  Countries:           ' << "#{Country.count}"
  puts "--------Creating States-----------------------------------------------"
  state = CreateStateService.new.call
  puts 'CREATED   Total  States:              ' << "#{State.count}"
  puts "--------Creating Articles---------------------------------------------"
  article = CreateArticleService.new.call
  puts 'CREATED   Total  Articles:            ' << "#{Article.count}"
  puts "--------Creating Events-----------------------------------------------"
  event = CreateEventService.new.call
  puts 'CREATED   Total  Events:              ' << "#{Event.count}"
  puts "--------Creating Items------------------------------------------------"
  item = CreateItemService.new.call
  puts 'CREATED   Total  Items:               ' << "#{Item.count}"
  puts "--------Creating ItemReviews------------------------------------------"
  item_review = CreateItemReviewService.new.call
  puts 'CREATED   Total  ItemsReviews:        ' << "#{ItemReview.count}"
  puts "--------Creating Foods------------------------------------------------"
  food = CreateFoodService.new.call
  puts 'CREATED   Total Foods:                ' << "#{Food.count}"
  puts "--------Creating Posts------------------------------------------------"
  post = CreatePostService.new.call
  puts 'CREATED   Total  Posts:               ' << "#{Post.count}"
  puts "--------Creating Fruits-----------------------------------------------"
  fruit = CreateFruitService.new.call
  puts 'CREATED   Total Fruits:               ' << "#{Fruit.count}"
  puts "--------Creating Sporters---------------------------------------------"
  sporter = CreateSporterService.new.call
  puts 'CREATED   Total Sporters:             ' << "#{Sporter.count}"
  puts "--------Creating Competitions-----------------------------------------"
  competition = CreateCompetitionService.new.call
  puts 'CREATED   Total Competitions:         ' << "#{Competition.count}"
  puts "--------Creating CompetitionResults-----------------------------------"
  competition_result = CreateCompetitionResultService.new.call
  puts 'CREATED   Total CompetitionResults:   ' << "#{CompetitionResult.count}"
  puts "--------Creating Tracks-----------------------------------------------"
  track = CreateTrackService.new.call
  puts 'CREATED   Total Tracks:               ' << "#{Track.count}"
  puts "--------Creating Goods------------------------------------------------"
  good = CreateGoodService.new.call
  puts 'CREATED   Total Goods:                ' << "#{Good.count}"
  puts "--------Creating Ticks------------------------------------------------"
  tick = CreateTickService.new.call
  puts 'CREATED   Total Ticks:                ' << "#{Tick.count}"
  puts "--------Creating Tacks------------------------------------------------"
  tack = CreateTackService.new.call
  puts 'CREATED   Total Tacks:                ' << "#{Tack.count}"
  puts "--------Creating Fantastics-------------------------------------------"
  fantastic = CreateFantasticService.new.call
  puts 'CREATED   Total Fantastics:           ' << "#{Fantastic.count}"
  puts "--------Creating Atoms------------------------------------------------"
  atom = CreateAtomService.new.call
  puts 'CREATED   Total Atoms:                ' << "#{Atom.count}"
  puts "--------Creating Books------------------------------------------------"
  book = CreateBookService.new.call
  puts 'CREATED   Total Books:                ' << "#{Book.count}"
  puts "--------Creating Reviews----------------------------------------------"
  review = CreateReviewService.new.call
  puts 'CREATED   Total Reviews:              ' << "#{Review.count}"
  puts "----------------------------------------------------------------------"
end

if Rails.env.test?
end

if Rails.env.production?
end
