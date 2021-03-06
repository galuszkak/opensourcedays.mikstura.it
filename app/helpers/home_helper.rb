module HomeHelper
  def i18n_switch_link
    {en: 'http://dwo.mikstura.it', pl: 'http://opensourcedays.mikstura.it'}[I18n.locale]
  end

  def i18n_switch_flag
    image_tag("/assets/layout/flags/#{{en: 'pl', pl: 'gb'}[I18n.locale]}.png", style: "height: 16px")
  end

  def i18n_switch
    link_to i18n_switch_link, class: 'external' do
      i18n_switch_flag
    end
  end

  def day_is_active(day)
    today = Date.today
    if day == :dayone and today == Date.new(2014, 3, 28)
      'active'
    elsif day == :daytwo and today == Date.new(2014, 3, 29)
      'active'
    elsif day == :daythree and today == Date.new(2014, 3, 30)
      'active'
    elsif day == :dayone
      'active'
    else
      nil
    end
  end

  def icon_by_type(type)
    class_name = {
        registration: 'iconf-eventbrite',
        keynote: 'iconf-microphone',
        talk: 'iconf-microphone',
        panel: 'iconf-dialogue-box',
        #breakfest: 'iconf-fast_food',
        breakfest: 'iconf-cup',
        lightningtalks: 'iconf-microphone',
        break: 'iconf-coffee',
        #lunch: 'iconf-pizza',
        lunch: 'iconf-food',
        welcome: 'iconf-megaphone',
        party: 'iconf-wine',
        bye: 'iconf-graduation-cap',
        see_you_tomorrow: 'iconf-megaphone'
    }[type.to_sym]

    content_tag(:i, nil, class: class_name)
  end
end
