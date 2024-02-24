# Керівництво для побудови моделі атрибуці

## Огляд
Необхідною складовою для побудови моделі атрибуції звичайно ж є дані. Основою є дані про продуктивність маркетингових кампаній.
Зазвичай такі дані можна здобути через ручне вивантаження в CSV, використовуючи UI рекламної платформи, або ж API. Такі дані є агрегованими та імперсоналізованими.

Завдання моделі атрибуції пов'язати такі дані з внутрішніми та надати змогу оцінити ефективність маркетингових кампаній.
А також побачити якість користувачів залучених з їх допомогою.

Щоб завдання було здійсненим, внутрішні дані повинні відповідати певним вимогам.
В залежності від типу бажаної моделі, вимоги можуть відрізнятися. Розглянемо наш випадок, де ми працюватемимо над first-touch моделлю.
Для вдалої реалізації, ми повинні фіксувати: 
- використовуючи cookie, здобуваємо конкретну веб-сторінку, що передувала першому відвідуванню нашого сайту (`referer`).
- зберігаємо сторінку нашого веб-сайту, що була першою відвіданою новим користувачем (`landing page`). 

Це дозволить пов'язати звіт з маркетингової платформи з нашими даними.

Щоб мати змогу збагатити модель атрибуції деякими додатковими корисними метриками, необхдіні певні базові дані, як то список продуктів та платежів при оплаті продуктів користувачами.

## Вхідні дані
Для роботи над проектом запропонований набір фейкових даних. Наш кейс - веб-сайт для онлайн-курсів.
### Marketing data
- `marketing_google.csv` - статистика Google Ads кампаній 
- `marketing_facebook.csv` - статистика Facebook Ads кампаній 
- `map_marketing_attribution.csv` - мапінг для атрибуції маркетингових кампаній
- `map_country.csv` - мапінг для нормалізації значення `country_code` 
### User data
- `user.csv` - зареєстрованні користувачі + корисні дані
- `course.csv` - наявні онлайн-курси
- `payment.csv` - платежі здійсненні користувачами для оплати курсів
- `map_source_medium.csv` - мапінг для атрибуції користувачів та змоги прив'язати до відповідного маркетингового каналу.

## Побудова моделі
Матеріали вже містять список таблиць, що необхідно побудувати для отримання фінальної моделі атрибуції.
Рекомендовано рухатися згідно структури матеріалів, почавши з опрацювання маркетингової статистики, далі внутрішні дані, і на завершення вже безпосередньо сама модель.
Кожен заздалегідь підготований `.sql` файл містить додаткові інструкції, щодо кожної таблиці та рекомендованої її структури. 