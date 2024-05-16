require 'active_graph'

class CRUDService
  def add_contact(name, phone)
    query = "CREATE (c:Contact {name: $name, phone: $phone}) RETURN c"
    result = ActiveGraph::Base.query(query, name: name, phone: phone)
    if result.any?
      "Contato adicionado com sucesso."
    else
      "Erro ao adicionar contato."
    end
  end

  def list_contacts
    query = "MATCH (c:Contact) RETURN c"
    results = ActiveGraph::Base.query(query)
    if results.any?
      results.map do |record|
        node = record['c']
        "#{node.id}: #{node[:name]}, #{node[:phone]}"
    else
      "Erro ao listar contatos."
    end
  end

  def update_contact(id, name, phone)
    query = "MATCH (c:Contact) WHERE id(c) = $id SET c.name = $name, c.phone = $phone RETURN c"
    result = ActiveGraph::Base.query(query, id: id.to_i, name: name, phone: phone)
    if result.any?
      "Contato atualizado com sucesso."
    else
      "Erro ao atualizar contato."
    end
  end

  def delete_contact(id)
    query = "MATCH (c:Contact) WHERE id(c) = $id DETACH DELETE c"
    result = ActiveGraph::Base.query(query, id: id.to_i)
    if result.any?
      "Contato deletado com sucesso."
    else
      "Erro ao deletar contato."
    end
  end
end
