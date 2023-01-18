require_relative '../label.rb'
require_relative '../storage_helper_methods/storage'

module LabelModule
  include Storage

  def add_label(thing)
    print "#{thing} Title: "
    title = gets.chomp
    print "#{thing} Color: "
    color = gets.chomp
    label = Label.new(title, color)
    store_label([label])
    label
  end

  def list_labels(labels)
    if labels.empty?
      puts 'Your label list is empty'
    else
      puts "LABEL LIST - count(#{labels.count})"
      puts "-----------------------------------------\n"
      labels.each_with_index do |label, index|
        puts "#{index + 1}) Title: '#{label.title}', Color: #{label.color} \n\n"
      end
    end
  end

  def store_label(labels)
    label = []
    labels.each do |item|
      label << {
        title: item.title,
        color: item.color,
        id: item.id
      }
    end
    return if labels.empty?
    store_data(label, './src/data/labels.json')
  end

  def get_labels
    labels = []
    data = get_data('./src/data/labels.json')
    data.each do |label|
      label = Label.new(label['title'], label['color'], id: label['id'])
      labels << label
    end
    labels
  end
end
