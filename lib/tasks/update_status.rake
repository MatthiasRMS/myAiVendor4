desc 'change mesages content'
task update_status: :environment do
  Session.all.each do |session|
    if session.last_exchange.present?
      if session.last_exchange > 15.minutes.ago
        session.update(status: "inactive")
      end
    end
  end
end
