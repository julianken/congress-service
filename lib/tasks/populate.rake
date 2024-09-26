namespace :populate do
  desc "Populate representatives by state"
  task populate_representatives_by_state: :environment do
    State.all.each do |state|
      res = state.fetch_representatives
      members = res['members']
      members.each do |member|
        Representative.find_or_create_by!(bioguide_id: member['bioguideId']) do |representative|
          representative.name = member['name']
          representative.state = state
          representative.current_member = true
          representative.party = member['partyName']
        end
      end
    end
  end
end

