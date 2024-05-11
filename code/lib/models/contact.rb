require 'neo4j'

class Contact
  include Neo4j::ActiveNode

  property :name, type: String
  property :phone, type: String

  validates :name, presence: true
  validates :phone, presence: true
end
