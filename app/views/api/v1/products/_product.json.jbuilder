json.extract! product, :id, :name, :sub_category_id, :availablity, :price, :condition, :description, :specification, :sku, :details
json.properties product.product_properties
json.images product.photos
json.colors product.colors
