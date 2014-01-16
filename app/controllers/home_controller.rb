class HomeController < ApplicationController
  layout 'base'
  #after_action :cache_index, only: [:index]
  def index
    prepare_speakers
    prepare_team
    prepare_talks
  end

  private

  #def cache_index
  #  cache_page(nil, "/#{I18n.locale}/index.html")
  #end

  def prepare_speakers
    @speakers = [
        {
            name: 'Kamil Gałuszka', title: 'Python Developer',
            #description: 'Kamil is working as Python/JavaScript developer on daily basis. In his free time he is trying to be involved in open source community. In not so free time he happen to be working with very skilled team mates in Solution4Future. Kamil believe that meeting great people can sharpen your skills so he is organizing meetjs meetup in Katowice with friends in Cowbell Labs. You can also meet him on PySilesia which is Silesia Python User Group.',
            #description: 'Kamil na codzień pracuje jako Python/JavaScript developer. W czasie wolnym angażuję się w działania społeczności Open Sourcy. W nie tak dokońca wolnym czasie, mam przyjemność pracować z bardzo utalentowanymi kolegami w Solution4Future. Kamil jest przekonany iż spotkania z wspaniałymi ludźmi mogą ulepszyć posiadane umiejętności, dlatego też organizuje meetjs meetup w Katowicach wspólnie z kolegami z Cowbell Labs. Można go również spotkać na PySilesia - śląskiej grupie używkowników Python. Ponadto Kamil stara się być aktywny w społecznościach: Mikstura.IT, Dni Wolnego Oprogramowania, Stowarzyszenie użytkowników Pythona.',
            description: "Kamil w czasie wolnym chętnie angażuje się działania społęczności Open Source",
            picture: 'Kamil_Galuszka.jpg',
            social: {twitter: 'https://twitter.com/galuszkak',
                     facebook: 'https://pl-pl.facebook.com/galuszkak',
                     google: 'https://plus.google.com/115271802415949853553/posts',
                     linkedin: 'http://pl.linkedin.com/pub/kamil-ga%C5%82uszka/4a/914/706'}
        },
        {
            name: 'Kate Terlecka', title: 'The Scrum Girl',
            #description: 'Kate Terlecka to jedna z najlepiej rozpoznawalnych twarzy polskiego Agile. Uczy Scruma i związanych z nim technik od lat, w róznych firmach, na różnych poziomach organizacyjnych i w różnych krajach. Jest związana ze Scrum.org jako oficjalny trener prawie od samego jego powstania. W Polsce działa jako założycielka i ogniwo łączące specjalistów pod parasolem inicjatywy Brass Willow, która łączy ludzi którzy mają coś ciekawego do powiedzenia i potrafią to przekazać. Prywatnie miłośniczka psów wszelakiej maści ze słabością do tych mniejszych, zapalona planszówkowiczka i miłośniczka kuchni bliskiego i dalekiego wschodu.',
            description: 'Kate Terlecka to jedna z najbardziej rozpoznawanych twarzy polskiego Agile.',
            picture: 'Kate_Terlecka.jpg',
            social: {twitter: 'https://twitter.com/kateterlecka',
                     google: 'https://plus.google.com/112917749347345443950/posts',
                     linkedin: 'http://pl.linkedin.com/pub/kate-terlecka/19/738/77a'}
        }
    ].map { |speaker| OpenStruct.new(speaker) }
  end

  def prepare_team
    @team = [{
                 name: 'Dominik Kozaczko', title: 'Wykładowca ATH',
                 description: 'Ojciec założyciel Dni Wolnego Oprogramowania',
                 picture: 'Dominik_Kozaczko.jpg',
                 social: {twitter: 'https://twitter.com/_DomKo_',
                          google: 'https://plus.google.com/110911336147638586954/posts',
                          linkedin: 'http://pl.linkedin.com/pub/dominik-kozaczko/30/6a3/844'}
             },
             {
                 name: 'Michał Czyż', title: 'VP @ Mikstura.IT',
                 description: 'Ojciec założyciel Dni Wolnego Oprogramowania',
                 picture: 'Michal_Czyz.jpg',
                 social: {twitter: 'http://bit.ly/twitter_michalczyz',
                          google: 'http://bit.ly/michalczyz_googleplus',
                          linkedin: 'http://linkd.in/michalczyz'}
             }
    ].map { |teammate| OpenStruct.new(teammate) }
  end

  def prepare_talks
    break_time = {
        type: :break, title: t('schedule.break.header'),
        speaker: nil,
        description: t('schedule.break.description')
    }
    @talks = {
        dayone: [
            {start_at: '15:00', type: :registration, title: t('schedule.registration.header'), speaker: nil,
             description: t('schedule.registration.description')},
            {start_at: '16:00', type: :welcome, title: t('schedule.welcome.header'), speaker: 'Dominik Kozaczko',
             description: t('schedule.welcome.description')},
            {start_at: '16:30', type: :talk, title: 'Wprowadzenie do świata free & Open Source',
             speaker: 'Kamil Gałuszka',
             description: 'Open Source jest czymś co zmieniło i zmienia świat. Chcę pokazać jak Ty drogi uczestniku możesz zaangażować się w świat otwartego kodu budowanego przez społeczność wielu niesamowitych ludzi.'
            }, {
                start_at: '16:50', type: :talk, title: 'Jak zacząć: programowanie',
                speaker: 'Michał Czyż',
                description: ' '},
            {
                start_at: '17:10', type: :talk, title: 'Umiejętności miękkie w zespołach IT',
                speaker: 'Dariusz Wylon',
                description: ' '},
            break_time.merge({
                                 start_at: '17:30'}),
            {
                start_at: '18:00', type: :keynote, title: 'Scrum - czyli jak poddać się zmianom i zrobić swoje',
                speaker: 'Kate Terlecka',
                description: 'Scrum to ostatnio bardzo mądre słowo. Ale w Polsce spotkałam dopiero 4 firmy, które na prawdę wiedzą o co w tym chodzi. Chcę wam przybliżyć co to jest Scrum i dlaczego jeśli już go wprowadzamy, to zapominamy o jego sercu.'},
            break_time.merge({
                                 start_at: '19:00'
                             }),
            {
                start_at: '19:15', type: :panel, title: 'Panel Dyskusyjny: "Kariera IT"',
                speaker: '[]',
                description: ' '}
        ].map { |talk| OpenStruct.new(talk) },
        daytwo: [
            {
                start_at: '08:30', type: :breakfest, title: t('schedule.breakfest.header'),
                speaker: nil,
                description: t('schedule.breakfest.description')
            },
            {
                start_at: '09:45', type: :welcome, title: t('schedule.welcome.header'),
                speaker: 'Dariusz Wylon',
                description: t('schedule.welcome.description')},
            {
                start_at: '10:00', type: :keynote, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            break_time.merge(start_at: '11:00'),
            {
                start_at: '11:30', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '11:50', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '12:10', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '12:30', type: :lunch, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '13:30', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '13:50', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '14:10', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            break_time.merge(start_at: '14:30'),
            {
                start_at: '15:00', type: :ligthingtalks, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            break_time.merge(start_at: '16:00'),
            {
                start_at: '16:30', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '16:50', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '17:10', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            break_time.merge(start_at: '17:30'),
            {
                start_at: '18:00', type: :keynote, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
        ].map { |talk| OpenStruct.new(talk) },
        daythree: [

        ].map { |talk| OpenStruct.new(talk) }
    }
  end
end
