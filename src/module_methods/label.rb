require_relative '../label'
require_relative '../storage_helper_methods/storage'

module LabelModule
  include Storage

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

  def store_label(data)
    label = []
    data.each do |item|
      label << {
        title: item.title,
        color: item.color,
        id: item.id
      }
    end
    return if data.empty?

    update_data(label, './src/data/labels.json')
  end

  def read_labels
    labels = []
    data = get_data('./src/data/labels.json')
    data.each do |label|
      label = Label.new(label['title'], label['color'], label['id'])
      labels << label
    end
    labels
  end
end
