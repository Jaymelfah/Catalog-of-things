require 'securerandom'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = SecureRandom.hex(7)
    @title = title
    @color = color
    @items = []
  end

  def self.list_all(labels)
    if labels.empty?
      puts 'Your label list is empty'
    else
      puts "Labels list, count(#{labels.count})🏷️ :\n\n"
      labels.each_with_index do |label, index|
        puts "#{index + 1}) Title: '#{label.title}', Color: #{label.color}"
      end
    end
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
