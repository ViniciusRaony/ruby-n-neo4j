require 'zeitwerk'
require 'active_support/all'
require 'neo4j-ruby-driver'
require 'active_graph'
require 'yaml'
require 'erb'
# TODO: Only neo4j.yml
begin
  # Load Neo4j config file with ERB to process environment variables
  config_path = File.join(File.dirname(__FILE__), 'neo4j.yml')
  neo4j_config_erb = ERB.new(File.read(config_path)).result
  neo4j_config = YAML.safe_load(neo4j_config_erb)['development']

  # Configure ActiveGraph driver
  ActiveGraph::Base.driver = Neo4j::Driver::GraphDatabase.driver(
    "bolt://#{neo4j_config['host']}:#{neo4j_config['port']}",
    Neo4j::Driver::AuthTokens.basic(neo4j_config['username'], neo4j_config['password'])
  )

rescue StandardError => e
  puts "Não foi possível conectar ao banco de dados neo4j: #{e.message}"
end
