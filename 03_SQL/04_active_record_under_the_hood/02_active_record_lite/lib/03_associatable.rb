require_relative '02_searchable'
require 'active_support/inflector'

class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    class_name.constantize.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    defaults = {
      foreign_key: "#{name}_id".to_sym,
      primary_key: :id,
      class_name: name.to_s.camelcase
    }

    defaults.keys.each do |attr_name|
      send("#{attr_name}=", options[attr_name] || defaults[attr_name])
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults = {
      foreign_key: "#{self_class_name.underscore}_id".to_sym,
      primary_key: :id,
      class_name: name.to_s.singularize.camelcase
    }

    defaults.keys.each do |attr_name|
      send("#{attr_name}=", options[attr_name] || defaults[attr_name])
    end
  end
end

module Associatable
  def belongs_to(name, options = {})
    self.assoc_options[name] = BelongsToOptions.new(name, options)

    define_method(name) do 
      options = self.class.assoc_options[name]

      foreign_val = send(options.foreign_key)
      foreign_class = options.model_class

      foreign_class.where(options.primary_key => foreign_val).first
    end
  end

  def has_many(name, options = {})
    self.assoc_options[name] = HasManyOptions.new(name, self.name, options)

    define_method(name) do
      options = self.class.assoc_options[name]

      foreign_val = send(options.primary_key)
      foreign_class = options.model_class

      foreign_class.where(options.foreign_key => foreign_val)
    end
  end

  def assoc_options
    @assoc_options ||= {}
    @assoc_options
  end
end

class SQLObject
  extend Associatable
end






































# require_relative '02_searchable'
# require 'active_support/inflector'

# # Phase IVa
# class AssocOptions
#   attr_accessor(
#     :foreign_key,
#     :class_name,
#     :primary_key 
#   )

#   def model_class
#     @class_name.constantize
#   end

#   def table_name
#     model_class.table_name
#   end
# end

# class BelongsToOptions < AssocOptions
#   def initialize(name, options = {})
#       defaults = {
#         :class_name => name.to_s.camelcase,
#         :foreign_key =>  "#{name}_id".to_sym,
#         :primary_key => :id
#       }
#       defaults.keys.each do |key|  
#         self.send("#{key}=", options[key] || defaults[key])
#       end
#   end
# end

# class HasManyOptions < AssocOptions
#   def initialize(name, self_class_name, options = {})
#     defaults = {
#       :class_name => name.to_s.singularize.camelcase,
#       :foreign_key => "#{self_class_name.to_s.underscore}_id".to_sym,
#       :primary_key => :id
#     }
#     defaults.keys.each do |key|  
#       self.send("#{key}=", options[key] || defaults[key])
#     end
#   end
# end

# module Associatable
#   def belongs_to(name , options = {})
#     self.assoc_options[name] = BelongsToOptions.new(name, options)
#     define_method(name) do
#       options = self.class.assoc_options[name]
#       key_value = self.send(options.foreign_key) 
#       options
#             .model_class
#             .where(options.primary_key => key_value)
#             .first
#     end
#   end

#   def has_many(name, options = {})
#     self.assoc_options[name] = HasManyOptions.new(name, self.name, options)
#     define_method(name) do
#       options = self.class.assoc_options[name]
#       key_value = self.send(options.primary_key)
#       options
#             .model_class
#             .where(options.foreign_key => key_value)
#     end
#   end

#   def assoc_options
#     @assoc_options ||= {}
#     @assoc_options
#   end
# end

# class SQLObject
#   extend Associatable
# end