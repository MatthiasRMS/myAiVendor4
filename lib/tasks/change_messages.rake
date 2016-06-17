desc 'change mesages content'
task change_messages: :environment do
  Message.all.each do |m|
    unless m.content.nil?
      if m.content.include?("#<ActionController")
        m.destroy
      end


      if m.content.include? "attachment"
        m.structured_messages = eval(m.content.clone)
        m.content = nil
        m.save
      end
    end

    unless m.structured_messages.nil?
      if m.structured_messages[-1,1] != "}"
        m.destroy
      end
    end
  end
end
