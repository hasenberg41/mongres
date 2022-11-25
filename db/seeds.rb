# frozen_string_literal: true

# Документы для официального трудоустройства в Польше
Document.connection.execute(
  "INSERT INTO documents(name, description, link_to_data)
  VALUES
  ('Zezwolenia na pracę cudzoziemca typ A', 'универсальный документ, который дает право легально работать.
    Этот документ выдается сроком от 1 года до 3 и позволяет на основании него сделать годовую воеводскую визу в Польшу.
    Делается этот документ работодателем в Уженде Воевудском от 2 до 6 месяцев.',
    '#'),
  ('Zezwolenia na pracę cudzoziemca typ В',
    'иностранец трудоустроен в польской ООО и пребывает на территории Польши более 6 месяцев в году.',
    '#'),
  ('Zezwolenia na pracę cudzoziemca typ С',
    'иностранец отправлен в командировку в филиал иностранной компании на территории Польши на срок более 30 дней.',
    '#'),
  ('Zezwolenia na pracę cudzoziemca typ D',
    'иностранец трудоустроен в иностранной компании, у которой нет филиала в Польше,
    но отправлен сюда в командировку с целью выполнения временных поручений.',
    '#'),
  ('Zezwolenia na pracę cudzoziemca typ Е',
    'документ, который дает право легально работать, иностранец трудоустроен в иностранной компании и был отправлен в
    Польшу на срок более 3 месяцев. Делается этот документ работодателем в Уженде Воевудском от 1 до 3 месяцев.',
    '#'),
  ('Zezwolenia na pracę cudzoziemca typ S',
    'документ, который дает право легально работать на сезонных работах: сельское хозяйство, лесоводство, туристика 
    сезонная, кемпинги. Этот документ выдается сроком на 9 месяцев.
    Делается этот документ работодателем в Повятовом Уженде Праци от 1 до 2 месяцев.',
    '#'),
  ('oświadczenie o powierzeniu pracy cudzoziemcowi',
    'Делается он работодателем в Уженде Праци 7-10 дней.',
    '#');".delete("\n")
)
