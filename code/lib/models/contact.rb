require 'active_graph'

class Contact
  include ActiveGraph::Node

  property :name, type: String
  property :phone, type: String

  validates :name, presence: true
  validates :phone, presence: true
end
