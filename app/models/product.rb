class Product < ApplicationRecord
  require 'csv'

  belongs_to :category, counter_cache: true
  has_many :order_items

  default_scope { where(active: true) }

  def self.search(term, page)
    if term
      where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 5).order('id DESC')
    else
      paginate(page: page, per_page: 3).order('id DESC')
    end
  end

  def category_name
    category.try(:name)
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name) if name.present?
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      product_hash = row.to_hash
      product = Product.where(id: product_hash["id"])

      if product.count == 1
        product.first.update_attributes(product_hash.except("price"))
      else
        Product.create!(product_hash)
      end
    end
  end
end
