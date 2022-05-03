module JustJoinIt
  class UpdateOffer
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def call
      @offer = Offer.find_or_initialize_by(jjit_id: data[:id])
      @offer.update(data.slice(*allowed_attributes))
      @offer.save!
      handle_employment_types(data[:employment_types])
      handle_multilocations(data[:multilocation])
      handle_skills(data[:skills])
    end

    def allowed_attributes
      [
        :title,
        :street,
        :city,
        :country_code,
        :address_text,
        :marker_icon,
        :workplace_type,
        :company_name,
        :company_url,
        :company_size,
        :experience_level,
        :latitude,
        :longitude,
        :published_at,
        :remote_interview,
        :open_to_hire_ukrainians,
        :display_offer,
        :remote,
        :way_of_apply,
        :company_logo_url
      ]
    end

    def handle_employment_types(new_employment_types)
      keepers = @offer.employment_types.select do |et|
        new_employment_types.any? do |net|
          salary = net[:salary] || {}
          net[:type] == et.name &&
            salary[:from] == et.from &&
            salary[:to] == et.to &&
            salary[:currency] == et.currency
        end
      end
      @offer.employment_types.where.not(id: keepers.map(&:id)).destroy_all
      @offer.employment_types.reload
      new_employment_types.each do |net|
        salary = net[:salary] || {}
        @offer.employment_types.find_or_create_by!(
          name: net[:type],
          from: salary[:from],
          to: salary[:to],
          currency: salary[:currency],
        )
      end
    end

    def handle_multilocations(new_multilocations)
      keepers = @offer.multilocations.select do |ml|
        new_multilocations.any? do |nml|
          nml[:city] == ml.city &&
          nml[:slug] == ml.slug &&
          nml[:street] == ml.street
        end
      end
      @offer.multilocations.where.not(id: keepers.map(&:id))
      @offer.multilocations.reload
      new_multilocations.each do |nml|
        @offer.multilocations.find_or_create_by!(
          city: nml[:city],
          slug: nml[:slug],
          street: nml[:street],
        )
      end
    end

    def handle_skills(skills)
      @offer.skills = skills.map do |ns|
        Skill.find_or_create_by!(name: ns[:name], level: ns[:level])
      end
      @offer.save!
    end
  end
end

