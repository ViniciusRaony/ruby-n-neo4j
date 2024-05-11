#!/usr/bin/env ruby
require_relative '../lib/config'
require_relative '../lib/services/crud_service'

class ContactCLI
  def initialize
    @crud_service = CRUDService.new
  end

  def start
    loop do
      puts "#"*52
      puts "APP CONTACT MANAGER NEO4J"
      puts "Digite um número válido:"
      puts "1: Adicionar contato"
      puts "2: Listar contatos"
      puts "3: Atualizar contato"
      puts "4: Deletar contato"
      puts "5: Sair"
      print "> "
      case gets.chomp
      when "1"
        print "Nome: "
        name = gets.chomp
        print "Telefone: "
        phone = gets.chomp
        puts @crud_service.add_contact(name, phone)
      when "2"
        contact_list = @crud_service.list_contacts
        if contact_list.empty?
          puts "Nenhum contato encontrado."
        else
          puts "#"*52
          puts "Listando contatos:"
          contact_list.each { |contact| puts contact }
        end
      when "3"
        puts "#"*52
        puts "Atualizando contato:"
        print "ID: "
        id = gets.chomp
        print "Nome: "
        name = gets.chomp
        print "Telefone: "
        phone = gets.chomp
        puts @crud_service.update_contact(id, name, phone)
      when "4"
        puts "#"*52
        puts "Deletar contato:"
        print "ID: "
        id = gets.chomp
        puts @crud_service.delete_contact(id)
      when "5"
        puts "Encerrando app..."
        break
      else
        puts "Comando desconhecido."
      end
    end
  end

end

cli = ContactCLI.new
cli.start