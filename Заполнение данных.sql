-- Вставка данных для всех 10 компаний в нормализованную структуру

-- 1. АО "СВОБОДА"
INSERT INTO organizations (
    inn, short_name, full_name, status, legal_address, production_address, 
    additional_site_address, registration_date, director_name,
    management_contact, employee_contact, emergency_contact, website, email,
    support_measures, msp_status, legal_address_coordinates, 
    production_address_coordinates, additional_site_coordinates,
    latitude, longitude, district, area
) VALUES (
    '7714431171', 'АО "СВОБОДА"', 'АКЦИОНЕРНОЕ ОБЩЕСТВО "СВОБОДА"', 'Действующая',
    '127015, г. Москва, ул. Вятская, д. 47 стр. 8 этаж 4 пом. 45-46',
    '127015, г. Москва, ул. Вятская, д. 47 стр. 8',
    '127015, г. Москва, ул. Вятская, д. 47 стр. 15',
    '2018-03-09', 'Иванов Петр Сидорович',
    'Генеральный директор, Иванов П.С., +7 (495) 123-45-67',
    'Менеджер по продажам, Сидорова А.И., +7 (495) 123-45-68',
    'Начальник отдела АХЧ, Петров В.К., +7 (495) 123-45-69',
    'http://www.svobodako.ru/', 'pr-service@svobodako.ru',
    'Получен грант на модернизацию производства (2023)', 'Не является субъектом МСП',
    POINT(55.802968, 37.580095), POINT(55.802968, 37.580095), POINT(55.803100, 37.581200),
    55.802968, 37.580095, 'САО', 'Савёловский'
);

INSERT INTO industry_classification (organization_id, main_industry, sub_industry, main_okved, main_okved_description, production_okved)
SELECT id, 'Химическая промышленность', 'Косметика', '20.42', 'Производство парфюмерных и косметических средств', '20.42'
FROM organizations WHERE inn = '7714431171';

INSERT INTO financial_indicators (organization_id, year, revenue, net_profit) VALUES
((SELECT id FROM organizations WHERE inn = '7714431171'), 2022, 4850000, 320000),
((SELECT id FROM organizations WHERE inn = '7714431171'), 2023, 5250000, 380000),
((SELECT id FROM organizations WHERE inn = '7714431171'), 2024, 5800000, 450000);

INSERT INTO personnel_indicators (organization_id, year, total_employees, moscow_employees, total_payroll, moscow_payroll, avg_salary_total, avg_salary_moscow) VALUES
((SELECT id FROM organizations WHERE inn = '7714431171'), 2022, 450, 450, 810000, 810000, 150, 150),
((SELECT id FROM organizations WHERE inn = '7714431171'), 2023, 460, 460, 864000, 864000, 156, 156),
((SELECT id FROM organizations WHERE inn = '7714431171'), 2024, 480, 480, 912000, 912000, 158, 158);

INSERT INTO tax_payments (organization_id, year, moscow_taxes, profit_tax, property_tax, land_tax, personal_income_tax) VALUES
((SELECT id FROM organizations WHERE inn = '7714431171'), 2022, 185000, 64000, 25000, 1500, 94500),
((SELECT id FROM organizations WHERE inn = '7714431171'), 2023, 198000, 76000, 26000, 1500, 94500),
((SELECT id FROM organizations WHERE inn = '7714431171'), 2024, 215000, 90000, 27000, 1500, 96500);

INSERT INTO investments_export (organization_id, year, investments_moscow, export_volume) VALUES
((SELECT id FROM organizations WHERE inn = '7714431171'), 2022, 120000, 350000),
((SELECT id FROM organizations WHERE inn = '7714431171'), 2023, 150000, 420000),
((SELECT id FROM organizations WHERE inn = '7714431171'), 2024, 200000, 500000);

INSERT INTO real_estate (organization_id, land_cadastral_number, land_area, land_use_type, land_ownership_type, land_owner, building_cadastral_number, building_area, building_use_type, building_type_purpose, building_ownership_type, building_owner, production_area) VALUES
((SELECT id FROM organizations WHERE inn = '7714431171'), '77:09:0004012:4954', 3021, 'Производственная деятельность (4.0)', 'Частная', 'АО "СВОБОДА"', '77:09:0004012:1084', 8500, 'Производственное здание', 'Нежилое, производство', 'Частная', 'АО "СВОБОДА"', 7800);

INSERT INTO products (organization_id, standardized_products, product_types, okpd2_codes, product_segments, product_catalog, has_government_orders, capacity_utilization_percent, has_export, export_volume_previous_year, import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7714431171'), true, 'Косметика по уходу за кожей и волосами; Декоративная косметика; Бытовая химия;', '20.41.12, 20.42.11, 20.42.13', 'Линия "Эффект"; Детское мыло; Краска для волос "GAMMA Perfect color"; Крем для бритья', 'Лосьоны и прочие средства для волос; Средства для очистки кожи лица; Средства гигиены полости рта', false, 85, true, 500000, 'Казахстан, Беларусь, Армения, Узбекистан');

-- 2. ООО "Московский Машиностроительный Завод "ЗАРЯ"
INSERT INTO organizations (
    inn, short_name, full_name, status, legal_address, production_address, 
    additional_site_address, registration_date, director_name,
    management_contact, employee_contact, emergency_contact, website, email,
    support_measures, msp_status, legal_address_coordinates, 
    production_address_coordinates, additional_site_coordinates,
    latitude, longitude, district, area
) VALUES (
    '7722567890', 'ООО "Московский Машиностроительный Завод "ЗАРЯ"', 
    'Общество с ограниченной ответственностью "Московский Машиностроительный Завод "ЗАРЯ"', 
    'Действующая', '115280, г. Москва, ул. Ленинская Слобода, д. 26',
    '115280, г. Москва, ул. Ленинская Слобода, д. 26',
    '115280, г. Москва, ул. Ленинская Слобода, д. 28',
    '1995-07-15', 'Сергеев Алексей Владимирович',
    'Генеральный директор, Сергеев А.В., +7 (495) 234-56-78',
    'Начальник отдела сбыта, Козлова Е.П., +7 (495) 234-56-79',
    'Главный инженер, Фролов И.Н., +7 (495) 234-56-80',
    'http://www.zarya-plant.ru/', 'info@zarya-plant.ru',
    'Субсидия на приобретение российского оборудования (2022)', 'Не является субъектом МСП',
    POINT(55.709123, 37.622045), POINT(55.709123, 37.622045), POINT(55.709500, 37.623100),
    55.709123, 37.622045, 'ЮАО', 'Замоскворечье'
);

INSERT INTO industry_classification (organization_id, main_industry, sub_industry, main_okved, main_okved_description, production_okved)
SELECT id, 'Машиностроение', 'Станкостроение', '28.41', 'Производство металлообрабатывающего оборудования', '28.41'
FROM organizations WHERE inn = '7722567890';

INSERT INTO financial_indicators (organization_id, year, revenue, net_profit) VALUES
((SELECT id FROM organizations WHERE inn = '7722567890'), 2022, 3200000, 180000),
((SELECT id FROM organizations WHERE inn = '7722567890'), 2023, 3550000, 210000),
((SELECT id FROM organizations WHERE inn = '7722567890'), 2024, 4100000, 290000);

INSERT INTO personnel_indicators (organization_id, year, total_employees, moscow_employees, total_payroll, moscow_payroll, avg_salary_total, avg_salary_moscow) VALUES
((SELECT id FROM organizations WHERE inn = '7722567890'), 2022, 500, 500, 780000, 780000, 130, 130),
((SELECT id FROM organizations WHERE inn = '7722567890'), 2023, 510, 510, 826200, 826200, 135, 135),
((SELECT id FROM organizations WHERE inn = '7722567890'), 2024, 520, 520, 873600, 873600, 140, 140);

INSERT INTO tax_payments (organization_id, year, moscow_taxes, profit_tax, property_tax, land_tax, personal_income_tax, other_taxes) VALUES
((SELECT id FROM organizations WHERE inn = '7722567890'), 2022, 165000, 36000, 45000, 3000, 81000, 0),
((SELECT id FROM organizations WHERE inn = '7722567890'), 2023, 185000, 42000, 46000, 3000, 84000, 10000),
((SELECT id FROM organizations WHERE inn = '7722567890'), 2024, 245000, 58000, 47000, 3000, 87000, 50000);

INSERT INTO investments_export (organization_id, year, investments_moscow, export_volume) VALUES
((SELECT id FROM organizations WHERE inn = '7722567890'), 2022, 80000, 900000),
((SELECT id FROM organizations WHERE inn = '7722567890'), 2023, 100000, 1050000),
((SELECT id FROM organizations WHERE inn = '7722567890'), 2024, 180000, 1200000);

INSERT INTO real_estate (organization_id, land_cadastral_number, land_area, land_use_type, land_ownership_type, land_owner, building_cadastral_number, building_area, building_use_type, building_type_purpose, building_ownership_type, building_owner, production_area) VALUES
((SELECT id FROM organizations WHERE inn = '7722567890'), '77:07:0134001:251', 15000, 'Для размещения промышленных объектов (4.1)', 'Частная', 'ООО "ММЗ ЗАРЯ"', '77:07:0134001:589', 22000, 'Производственно-лабораторный корпус', 'Нежилое, производство', 'Частная', 'ООО "ММЗ ЗАРЯ"', 20500);

INSERT INTO products (organization_id, standardized_products, product_types, okpd2_codes, product_segments, product_catalog, has_government_orders, capacity_utilization_percent, has_export, export_volume_previous_year, import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7722567890'), true, 'Токарные и фрезерные станки с ЧПУ; Промышленные роботизированные комплексы', '28.41.11, 28.41.12, 28.99.1', 'Станок токарный с ЧПУ "Заря-650Т"; Роботизированный сварочный комплекс "Заря-РСК-2000"', 'Станки токарные; Станки фрезерные; Промышленные роботы', true, 90, true, 1200000, 'Индия, Турция, Египет');

-- 3. АО "ЭЛЕКТРОСИЛА"
INSERT INTO organizations (
    inn, short_name, full_name, status, legal_address, production_address, 
    additional_site_address, registration_date, director_name,
    management_contact, employee_contact, emergency_contact, website, email,
    support_measures, special_status, msp_status, legal_address_coordinates, 
    production_address_coordinates, additional_site_coordinates,
    latitude, longitude, district, area
) VALUES (
    '7733312345', 'АО "ЭЛЕКТРОСИЛА"', 'Акционерное общество "ЭЛЕКТРОСИЛА"', 
    'Действующая', '115201, г. Москва, Каширское шоссе, д. 31',
    '115201, г. Москва, Каширское шоссе, д. 31',
    '115201, г. Москва, Каширское шоссе, д. 33',
    '2002-11-12', 'Николаев Дмитрий Олегович',
    'Генеральный директор, Николаев Д.О., +7 (495) 345-67-89',
    'Заместитель генерального директора, Воробьева С.М., +7 (495) 345-67-90',
    'Начальник службы безопасности, Семенов А.К., +7 (495) 345-67-91',
    'http://www.electrosila.ru/', 'office@electrosila.ru',
    NULL, 'Резидент ОЭЗ "Технополис "Москва"', 'Не является субъектом МСП',
    POINT(55.632874, 37.663241), POINT(55.632874, 37.663241), POINT(55.633500, 37.664300),
    55.632874, 37.663241, 'ЮАО', 'Москворечье-Сабурово'
);

INSERT INTO industry_classification (organization_id, main_industry, sub_industry, main_okved, main_okved_description, production_okved)
SELECT id, 'Электроника и электротехника', 'Электроэнергетическое машиностроение', '27.11', 'Производство электродвигателей, генераторов и трансформаторов', '27.11'
FROM organizations WHERE inn = '7733312345';

INSERT INTO financial_indicators (organization_id, year, revenue, net_profit) VALUES
((SELECT id FROM organizations WHERE inn = '7733312345'), 2022, 8500000, 620000),
((SELECT id FROM organizations WHERE inn = '7733312345'), 2023, 9200000, 750000),
((SELECT id FROM organizations WHERE inn = '7733312345'), 2024, 10500000, 920000);

INSERT INTO personnel_indicators (organization_id, year, total_employees, moscow_employees, total_payroll, moscow_payroll, avg_salary_total, avg_salary_moscow) VALUES
((SELECT id FROM organizations WHERE inn = '7733312345'), 2022, 1050, 1050, 2100000, 2100000, 166.7, 166.7),
((SELECT id FROM organizations WHERE inn = '7733312345'), 2023, 1080, 1080, 2268000, 2268000, 175, 175),
((SELECT id FROM organizations WHERE inn = '7733312345'), 2024, 1100, 1100, 2442000, 2442000, 185, 185);

INSERT INTO tax_payments (organization_id, year, moscow_taxes, profit_tax, property_tax, land_tax, personal_income_tax, transport_tax) VALUES
((SELECT id FROM organizations WHERE inn = '7733312345'), 2022, 420000, 124000, 85000, 5000, 206000, 0),
((SELECT id FROM organizations WHERE inn = '7733312345'), 2023, 470000, 150000, 87000, 5000, 218000, 10000),
((SELECT id FROM organizations WHERE inn = '7733312345'), 2024, 510000, 184000, 89000, 5000, 222000, 10000);

INSERT INTO investments_export (organization_id, year, investments_moscow, export_volume) VALUES
((SELECT id FROM organizations WHERE inn = '7733312345'), 2022, 500000, 2800000),
((SELECT id FROM organizations WHERE inn = '7733312345'), 2023, 600000, 3200000),
((SELECT id FROM organizations WHERE inn = '7733312345'), 2024, 750000, 3500000);

INSERT INTO real_estate (organization_id, land_cadastral_number, land_area, land_use_type, land_ownership_type, land_owner, building_cadastral_number, building_area, building_use_type, building_type_purpose, building_ownership_type, building_owner, production_area) VALUES
((SELECT id FROM organizations WHERE inn = '7733312345'), '77:06:0542002:781', 25000, 'Для размещения объектов промышленности (4.1)', 'Частная', 'АО "ЭЛЕКТРОСИЛА"', '77:06:0542002:1452', 35000, 'Производственный комплекс', 'Нежилое, производство', 'Частная', 'АО "ЭЛЕКТРОСИЛА"', 32000);

INSERT INTO products (organization_id, standardized_products, product_types, okpd2_codes, product_segments, product_catalog, has_government_orders, capacity_utilization_percent, has_export, export_volume_previous_year, import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7733312345'), true, 'Синхронные генераторы; Тяговые электродвигатели; Силовые трансформаторы', '27.11.11, 27.11.12, 27.11.21', 'Генератор "ЭС-10000"; Трансформатор силовой "ТМ-2500"; Двигатель тяговый "ДТ-800"', 'Генераторы электрические; Трансформаторы силовые; Электродвигатели', true, 95, true, 3500000, 'Китай, Вьетнам, Иран');

-- 4. ООО "МОСПИЩЕПРОМ"
INSERT INTO organizations (
    inn, short_name, full_name, status, legal_address, production_address, 
    additional_site_address, registration_date, director_name,
    management_contact, employee_contact, emergency_contact, website, email,
    support_measures, msp_status, legal_address_coordinates, 
    production_address_coordinates, additional_site_coordinates,
    latitude, longitude, district, area
) VALUES (
    '7744456789', 'ООО "МОСПИЩЕПРОМ"', 
    'Общество с ограниченной ответственностью "МОСПИЩЕПРОМ"', 
    'Действующая', '109316, г. Москва, Волгоградский проспект, д. 42, корп. 23',
    '109316, г. Москва, Волгоградский проспект, д. 42, корп. 23',
    '109316, г. Москва, ул. Талалихина, д. 41',
    '2010-05-22', 'Васильева Ольга Игоревна',
    'Генеральный директор, Васильева О.И., +7 (495) 456-78-90',
    'Менеджер по закупкам, Тихонов М.С., +7 (495) 456-78-91',
    'Заместитель директора по общим вопросам, Белов Р.Д., +7 (495) 456-78-92',
    'http://www.mospishprom.ru/', 'sales@mospishprom.ru',
    'Участие в программе "Продовольственная безопасность Москвы"', 'Среднее предприятие',
    POINT(55.705215, 37.754689), POINT(55.705215, 37.754689), POINT(55.711300, 37.751100),
    55.705215, 37.754689, 'ЮВАО', 'Текстильщики'
);

INSERT INTO industry_classification (organization_id, main_industry, sub_industry, main_okved, main_okved_description, production_okved)
SELECT id, 'Пищевая промышленность', 'Кондитерские изделия', '10.72', 'Производство сухарей, печенья и прочих сухарных хлебобулочных изделий, производство мучных кондитерских изделий, тортов и пирожных недлительного хранения', '10.72'
FROM organizations WHERE inn = '7744456789';

INSERT INTO financial_indicators (organization_id, year, revenue, net_profit) VALUES
((SELECT id FROM organizations WHERE inn = '7744456789'), 2022, 2100000, 95000),
((SELECT id FROM organizations WHERE inn = '7744456789'), 2023, 2300000, 105000),
((SELECT id FROM organizations WHERE inn = '7744456789'), 2024, 2450000, 115000);

INSERT INTO personnel_indicators (organization_id, year, total_employees, moscow_employees, total_payroll, moscow_payroll, avg_salary_total, avg_salary_moscow) VALUES
((SELECT id FROM organizations WHERE inn = '7744456789'), 2022, 270, 270, 356400, 356400, 110, 110),
((SELECT id FROM organizations WHERE inn = '7744456789'), 2023, 275, 275, 371250, 371250, 112.5, 112.5),
((SELECT id FROM organizations WHERE inn = '7744456789'), 2024, 280, 280, 386400, 386400, 115, 115);

INSERT INTO tax_payments (organization_id, year, moscow_taxes, profit_tax, property_tax, land_tax, personal_income_tax, transport_tax, other_taxes) VALUES
((SELECT id FROM organizations WHERE inn = '7744456789'), 2022, 85000, 19000, 15000, 1000, 46400, 3600, 0),
((SELECT id FROM organizations WHERE inn = '7744456789'), 2023, 92000, 21000, 15500, 1000, 48250, 3750, 2500),
((SELECT id FROM organizations WHERE inn = '7744456789'), 2024, 98000, 23000, 16000, 1000, 50400, 3600, 4000);

INSERT INTO investments_export (organization_id, year, investments_moscow, export_volume) VALUES
((SELECT id FROM organizations WHERE inn = '7744456789'), 2022, 50000, 120000),
((SELECT id FROM organizations WHERE inn = '7744456789'), 2023, 60000, 140000),
((SELECT id FROM organizations WHERE inn = '7744456789'), 2024, 75000, 150000);

INSERT INTO real_estate (organization_id, land_cadastral_number, land_area, land_use_type, land_ownership_type, land_owner, building_cadastral_number, building_area, building_use_type, building_type_purpose, building_ownership_type, building_owner, production_area) VALUES
((SELECT id FROM organizations WHERE inn = '7744456789'), '77:05:0721001:334', 5000, 'Для размещения объектов торговли и общественного питания (4.6)', 'Частная', 'ООО "МОСПИЩЕПРОМ"', '77:05:0721001:876', 8000, 'Производственно-складской комплекс', 'Нежилое, производство', 'Частная', 'ООО "МОСПИЩЕПРОМ"', 6500);

INSERT INTO products (organization_id, standardized_products, product_types, okpd2_codes, product_segments, product_catalog, has_government_orders, capacity_utilization_percent, has_export, export_volume_previous_year, import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7744456789'), true, 'Печенье, вафли, пряники, зефир', '10.72.12, 10.72.13, 10.72.14', 'Печенье "Московское" сдобное; Вафли "Волжские" с начинкой; Зефир "Белая ночь"', 'Печенье; Вафли; Пряники; Зефир; Сухари', true, 78, true, 150000, 'Казахстан, Беларусь, Азербайджан');

-- 5. ЗАО "МЕТАЛЛООБРАБОТКА"
INSERT INTO organizations (
    inn, short_name, full_name, status, legal_address, production_address, 
    registration_date, director_name,
    management_contact, employee_contact, emergency_contact, website, email,
    support_measures, msp_status, legal_address_coordinates, 
    production_address_coordinates, latitude, longitude, district, area
) VALUES (
    '7755567890', 'ЗАО "МЕТАЛЛООБРАБОТКА"', 
    'Закрытое акционерное общество "МЕТАЛЛООБРАБОТКА"', 
    'Действующая', '125363, г. Москва, ул. Свободы, д. 35, стр. 2',
    '125363, г. Москва, ул. Свободы, д. 35, стр. 2',
    '2008-09-18', 'Кузнецов Виктор Александрович',
    'Генеральный директор, Кузнецов В.А., +7 (495) 567-89-01',
    'Главный технолог, Орлов С.П., +7 (495) 567-89-02',
    'Инженер по охране труда, Михайлова Л.Н., +7 (495) 567-89-03',
    'http://www.metallobr.ru/', 'info@metallobr.ru',
    'Кредит по льготной программе для МСП (2022)', 'Среднее предприятие',
    POINT(55.855621, 37.400125), POINT(55.855621, 37.400125),
    55.855621, 37.400125, 'СЗАО', 'Покровское-Стрешнево'
);

INSERT INTO industry_classification (organization_id, main_industry, sub_industry, main_okved, main_okved_description, production_okved)
SELECT id, 'Металлообработка', 'Изготовление металлоконструкций', '25.11', 'Производство строительных металлических конструкций, изделий и их частей', '25.11'
FROM organizations WHERE inn = '7755567890';

INSERT INTO financial_indicators (organization_id, year, revenue, net_profit) VALUES
((SELECT id FROM organizations WHERE inn = '7755567890'), 2022, 1550000, 45000),
((SELECT id FROM organizations WHERE inn = '7755567890'), 2023, 1480000, 38000),
((SELECT id FROM organizations WHERE inn = '7755567890'), 2024, 1650000, 60000);

INSERT INTO personnel_indicators (organization_id, year, total_employees, moscow_employees, total_payroll, moscow_payroll, avg_salary_total, avg_salary_moscow) VALUES
((SELECT id FROM organizations WHERE inn = '7755567890'), 2022, 185, 185, 244200, 244200, 110, 110),
((SELECT id FROM organizations WHERE inn = '7755567890'), 2023, 188, 188, 252960, 252960, 112, 112),
((SELECT id FROM organizations WHERE inn = '7755567890'), 2024, 190, 190, 258400, 258400, 113.3, 113.3);

INSERT INTO tax_payments (organization_id, year, moscow_taxes, profit_tax, property_tax, land_tax, personal_income_tax, transport_tax, other_taxes) VALUES
((SELECT id FROM organizations WHERE inn = '7755567890'), 2022, 58000, 9000, 12000, 800, 31700, 4500, 0),
((SELECT id FROM organizations WHERE inn = '7755567890'), 2023, 60000, 7600, 12500, 800, 32900, 4700, 1500),
((SELECT id FROM organizations WHERE inn = '7755567890'), 2024, 65000, 12000, 13000, 800, 33600, 4600, 1000);

INSERT INTO investments_export (organization_id, year, investments_moscow, export_volume) VALUES
((SELECT id FROM organizations WHERE inn = '7755567890'), 2022, 25000, 70000),
((SELECT id FROM organizations WHERE inn = '7755567890'), 2023, 20000, 75000),
((SELECT id FROM organizations WHERE inn = '7755567890'), 2024, 35000, 80000);

INSERT INTO real_estate (organization_id, land_cadastral_number, land_area, land_use_type, land_ownership_type, land_owner, building_cadastral_number, building_area, building_use_type, building_type_purpose, building_ownership_type, building_owner, production_area) VALUES
((SELECT id FROM organizations WHERE inn = '7755567890'), '77:08:0912003:552', 3500, 'Для размещения производственных объектов (4.1)', 'Частная', 'ЗАО "МЕТАЛЛООБРАБОТКА"', '77:08:0912003:1123', 6000, 'Производственный цех', 'Нежилое, производство', 'Частная', 'ЗАО "МЕТАЛЛООБРАБОТКА"', 5500);

INSERT INTO products (organization_id, standardized_products, product_types, okpd2_codes, product_segments, product_catalog, has_government_orders, capacity_utilization_percent, has_export, export_volume_previous_year, import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7755567890'), true, 'Металлоконструкции строительные, Ограждения, Балки и фермы', '25.11.10, 25.12.11, 25.12.12', 'Фермы стропильные; Колонны металлические; Ограждения дорожные', 'Металлоконструкции для строительства; Ограждения; Нестандартные металлоизделия', true, 70, true, 80000, 'Беларусь, Абхазия');

-- Продолжение для остальных 5 компаний...

-- 6. ООО "НАУЧПРИБОР"
INSERT INTO organizations (
    inn, short_name, full_name, status, legal_address, production_address, 
    additional_site_address, registration_date, director_name,
    management_contact, employee_contact, emergency_contact, website, email,
    support_measures, special_status, msp_status, legal_address_coordinates, 
    production_address_coordinates, additional_site_coordinates,
    latitude, longitude, district, area
) VALUES (
    '7766678901', 'ООО "НАУЧПРИБОР"', 
    'Общество с ограниченной ответственностью "НАУЧПРИБОР"', 
    'Действующая', '117342, г. Москва, ул. Бутлерова, д. 17, корп. 4',
    '117342, г. Москва, ул. Бутлерова, д. 17, корп. 4',
    '117342, г. Москва, ул. Миклухо-Маклая, д. 41',
    '2015-01-30', 'Соколова Анна Михайловна',
    'Генеральный директор, Соколова А.М., +7 (495) 678-90-12',
    'Руководитель отдела разработок, Гришин П.Л., +7 (495) 678-90-13',
    'Инженер по эксплуатации, Дорофеев К.В., +7 (495) 678-90-14',
    'http://www.nauchpribor.ru/', 'tech@nauchpribor.ru',
    'Грант "Фонда Сколково" на разработку (2021-2023)', 'Резидент "Фонда Сколково"', 'Среднее предприятие',
    POINT(55.650234, 37.514567), POINT(55.650234, 37.514567), POINT(55.653000, 37.520000),
    55.650234, 37.514567, 'ЮЗАО', 'Обручевский'
);

INSERT INTO industry_classification (organization_id, main_industry, sub_industry, main_okved, main_okved_description, production_okved)
SELECT id, 'Приборостроение', 'Медицинские приборы и аппараты', '26.60', 'Производство приборов и аппаратов для радиологии, электрофизиологии и радиологии', '26.60'
FROM organizations WHERE inn = '7766678901';

INSERT INTO financial_indicators (organization_id, year, revenue, net_profit) VALUES
((SELECT id FROM organizations WHERE inn = '7766678901'), 2022, 950000, 110000),
((SELECT id FROM organizations WHERE inn = '7766678901'), 2023, 1150000, 150000),
((SELECT id FROM organizations WHERE inn = '7766678901'), 2024, 1450000, 210000);

INSERT INTO personnel_indicators (organization_id, year, total_employees, moscow_employees, total_payroll, moscow_payroll, avg_salary_total, avg_salary_moscow) VALUES
((SELECT id FROM organizations WHERE inn = '7766678901'), 2022, 195, 195, 339300, 339300, 145, 145),
((SELECT id FROM organizations WHERE inn = '7766678901'), 2023, 200, 200, 360000, 360000, 150, 150),
((SELECT id FROM organizations WHERE inn = '7766678901'), 2024, 210, 210, 390600, 390600, 155, 155);

INSERT INTO tax_payments (organization_id, year, moscow_taxes, profit_tax, property_tax, land_tax, personal_income_tax, other_taxes) VALUES
((SELECT id FROM organizations WHERE inn = '7766678901'), 2022, 95000, 22000, 8000, 500, 44100, 20400),
((SELECT id FROM organizations WHERE inn = '7766678901'), 2023, 110000, 30000, 8500, 500, 46800, 24200),
((SELECT id FROM organizations WHERE inn = '7766678901'), 2024, 120000, 42000, 9000, 500, 50800, 17700);

INSERT INTO investments_export (organization_id, year, investments_moscow, export_volume) VALUES
((SELECT id FROM organizations WHERE inn = '7766678901'), 2022, 120000, 300000),
((SELECT id FROM organizations WHERE inn = '7766678901'), 2023, 150000, 400000),
((SELECT id FROM organizations WHERE inn = '7766678901'), 2024, 180000, 450000);

INSERT INTO real_estate (organization_id, land_cadastral_number, land_area, land_use_type, land_ownership_type, land_owner, building_cadastral_number, building_area, building_use_type, building_type_purpose, building_ownership_type, building_owner, production_area) VALUES
((SELECT id FROM organizations WHERE inn = '7766678901'), '77:02:1105004:778', 2000, 'Для научно-исследовательской деятельности (3.9)', 'Частная', 'ООО "НАУЧПРИБОР"', '77:02:1105004:1456', 4500, 'Научно-производственный центр', 'Нежилое, производство и НИОКР', 'Частная', 'ООО "НАУЧПРИБОР"', 3500);

INSERT INTO products (organization_id, standardized_products, product_types, okpd2_codes, product_segments, product_catalog, has_government_orders, capacity_utilization_percent, has_export, export_volume_previous_year, import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7766678901'), true, 'Аппараты УЗИ, Электронные микроскопы, Аналитические весы', '26.60.11, 26.51.12, 26.51.13', 'Аппарат УЗИ "Скан-М"; Электронный микроскоп "ЭМ-2000"; Весы аналитические "ВА-500"', 'Медицинская диагностическая аппаратура; Научное и аналитическое оборудование', true, 88, true, 450000, 'Германия, Южная Корея, Израиль');

-- 7. АО "МОСФАРМ"
INSERT INTO organizations (
    inn, short_name, full_name, status, legal_address, production_address, 
    additional_site_address, registration_date, director_name,
    management_contact, employee_contact, emergency_contact, website, email,
    support_measures, special_status, msp_status, legal_address_coordinates, 
    production_address_coordinates, additional_site_coordinates,
    latitude, longitude, district, area
) VALUES (
    '7777789012', 'АО "МОСФАРМ"', 'Акционерное общество "МОСФАРМ"', 
    'Действующая', '123098, г. Москва, ул. Берзарина, д. 12',
    '123098, г. Москва, ул. Берзарина, д. 12',
    '123098, г. Москва, ул. Расплетина, д. 16',
    '2000-12-05', 'Ковалев Игорь Сергеевич',
    'Генеральный директор, Ковалев И.С., +7 (495) 789-01-23',
    'Начальник отдела контроля качества, Романова Е.В., +7 (495) 789-01-24',
    'Заместитель главного инженера, Сафронов А.П., +7 (495) 789-01-25',
    'http://www.mosfarm.ru/', 'contact@mosfarm.ru',
    'Субсидии в рамках программы "Фарма-2020"', 'Промышленный комплекс', 'Не является субъектом МСП',
    POINT(55.791234, 37.498765), POINT(55.791234, 37.498765), POINT(55.793000, 37.501000),
    55.791234, 37.498765, 'СЗАО', 'Щукино'
);

INSERT INTO industry_classification (organization_id, main_industry, sub_industry, main_okved, main_okved_description, production_okved)
SELECT id, 'Фармацевтическая промышленность', 'Производство готовых лекарственных средств', '21.20', 'Производство лекарственных препаратов и материалов, применяемых в медицинских целях', '21.20'
FROM organizations WHERE inn = '7777789012';

INSERT INTO financial_indicators (organization_id, year, revenue, net_profit) VALUES
((SELECT id FROM organizations WHERE inn = '7777789012'), 2022, 12000000, 1800000),
((SELECT id FROM organizations WHERE inn = '7777789012'), 2023, 14500000, 2300000),
((SELECT id FROM organizations WHERE inn = '7777789012'), 2024, 17200000, 3100000);

INSERT INTO personnel_indicators (organization_id, year, total_employees, moscow_employees, total_payroll, moscow_payroll, avg_salary_total, avg_salary_moscow) VALUES
((SELECT id FROM organizations WHERE inn = '7777789012'), 2022, 1420, 1420, 2698000, 2698000, 158.3, 158.3),
((SELECT id FROM organizations WHERE inn = '7777789012'), 2023, 1460, 1460, 2847600, 2847600, 162.5, 162.5),
((SELECT id FROM organizations WHERE inn = '7777789012'), 2024, 1500, 1500, 2955000, 2955000, 164.2, 164.2);

INSERT INTO tax_payments (organization_id, year, moscow_taxes, profit_tax, property_tax, land_tax, personal_income_tax, transport_tax) VALUES
((SELECT id FROM organizations WHERE inn = '7777789012'), 2022, 850000, 360000, 120000, 7000, 350700, 12300),
((SELECT id FROM organizations WHERE inn = '7777789012'), 2023, 950000, 460000, 125000, 7000, 370100, 12900),
((SELECT id FROM organizations WHERE inn = '7777789012'), 2024, 1050000, 620000, 130000, 7000, 384000, 13000);

INSERT INTO investments_export (organization_id, year, investments_moscow, export_volume) VALUES
((SELECT id FROM organizations WHERE inn = '7777789012'), 2022, 800000, 4500000),
((SELECT id FROM organizations WHERE inn = '7777789012'), 2023, 1000000, 5200000),
((SELECT id FROM organizations WHERE inn = '7777789012'), 2024, 1500000, 5800000);

INSERT INTO real_estate (organization_id, land_cadastral_number, land_area, land_use_type, land_ownership_type, land_owner, building_cadastral_number, building_area, building_use_type, building_type_purpose, building_ownership_type, building_owner, production_area) VALUES
((SELECT id FROM organizations WHERE inn = '7777789012'), '77:04:1207005:991', 18000, 'Для размещения объектов фармацевтической промышленности (4.1)', 'Частная', 'АО "МОСФАРМ"', '77:04:1207005:2234', 40000, 'Фармацевтический производственный комплекс', 'Нежилое, производство', 'Частная', 'АО "МОСФАРМ"', 35000);

INSERT INTO products (organization_id, standardized_products, product_types, okpd2_codes, product_segments, product_catalog, has_government_orders, capacity_utilization_percent, has_export, export_volume_previous_year, import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7777789012'), true, 'Антибиотики, Сердечно-сосудистые препараты, Противовоспалительные средства', '21.20.1, 21.20.2', '"Амоксиклав МФ"; "Аторвастатин МФ"; "Ибупрофен МФ"', 'Антибактериальные препараты; Кардиологические препараты; Анальгетики и НПВС', true, 92, true, 5800000, 'Страны СНГ, Вьетнам, Сербия, Ближний Восток');

-- 8. ООО "ПОЛИМЕРТЕХ"
INSERT INTO organizations (
    inn, short_name, full_name, status, legal_address, production_address, 
    registration_date, director_name,
    management_contact, employee_contact, emergency_contact, website, email,
    msp_status, legal_address_coordinates, production_address_coordinates,
    latitude, longitude, district, area
) VALUES (
    '7788890123', 'ООО "ПОЛИМЕРТЕХ"', 
    'Общество с ограниченной ответственностью "ПОЛИМЕРТЕХ"', 
    'Действующая', '115230, г. Москва, 1-й Нагатинский пр-д, д. 15',
    '115230, г. Москва, 1-й Нагатинский пр-д, д. 15',
    '2012-03-14', 'Тарасов Евгений Викторович',
    'Директор, Тарасов Е.В., +7 (495) 890-12-34',
    'Менеджер по производству, Киселева Н.Д., +7 (495) 890-12-35',
    'Инженер-химик, Абрамов С.И., +7 (495) 890-12-36',
    'http://www.polymertech.ru/', 'order@polymertech.ru',
    'Малое предприятие', POINT(55.683456, 37.622345), POINT(55.683456, 37.622345),
    55.683456, 37.622345, 'ЮАО', 'Нагатинский Затон'
);

INSERT INTO industry_classification (organization_id, main_industry, sub_industry, main_okved, main_okved_description, production_okved)
SELECT id, 'Химическая промышленность', 'Производство пластмассовых изделий', '22.29', 'Производство прочих пластмассовых изделий', '22.29'
FROM organizations WHERE inn = '7788890123';

INSERT INTO financial_indicators (organization_id, year, revenue, net_profit) VALUES
((SELECT id FROM organizations WHERE inn = '7788890123'), 2022, 1800000, 75000),
((SELECT id FROM organizations WHERE inn = '7788890123'), 2023, 1950000, 85000),
((SELECT id FROM organizations WHERE inn = '7788890123'), 2024, 2100000, 95000);

INSERT INTO personnel_indicators (organization_id, year, total_employees, moscow_employees, total_payroll, moscow_payroll, avg_salary_total, avg_salary_moscow) VALUES
((SELECT id FROM organizations WHERE inn = '7788890123'), 2022, 160, 160, 230400, 230400, 120, 120),
((SELECT id FROM organizations WHERE inn = '7788890123'), 2023, 162, 162, 238680, 238680, 122.8, 122.8),
((SELECT id FROM organizations WHERE inn = '7788890123'), 2024, 165, 165, 244200, 244200, 123.3, 123.3);

INSERT INTO tax_payments (organization_id, year, moscow_taxes, profit_tax, property_tax, land_tax, personal_income_tax, transport_tax, other_taxes) VALUES
((SELECT id FROM organizations WHERE inn = '7788890123'), 2022, 70000, 15000, 10000, 600, 29900, 3500, 10000),
((SELECT id FROM organizations WHERE inn = '7788890123'), 2023, 75000, 17000, 10500, 600, 31000, 3700, 11200),
((SELECT id FROM organizations WHERE inn = '7788890123'), 2024, 78000, 19000, 11000, 600, 31700, 3700, 12000);

INSERT INTO investments_export (organization_id, year, investments_moscow, export_volume) VALUES
((SELECT id FROM organizations WHERE inn = '7788890123'), 2022, 40000, 250000),
((SELECT id FROM organizations WHERE inn = '7788890123'), 2023, 50000, 280000),
((SELECT id FROM organizations WHERE inn = '7788890123'), 2024, 55000, 300000);

INSERT INTO real_estate (organization_id, land_cadastral_number, land_area, land_use_type, land_ownership_type, land_owner, building_cadastral_number, building_area, building_use_type, building_type_purpose, building_ownership_type, building_owner, production_area) VALUES
((SELECT id FROM organizations WHERE inn = '7788890123'), '77:03:1308006:445', 4000, 'Для размещения производственных объектов (4.1)', 'Частная', 'ООО "ПОЛИМЕРТЕХ"', '77:03:1308006:1122', 7000, 'Производственный цех', 'Нежилое, производство', 'Частная', 'ООО "ПОЛИМЕРТЕХ"', 6000);

INSERT INTO products (organization_id, standardized_products, product_types, okpd2_codes, product_segments, product_catalog, has_government_orders, capacity_utilization_percent, has_export, export_volume_previous_year, import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7788890123'), true, 'Пластиковая тара, Полимерные трубы, Пленка упаковочная', '22.29.11, 22.21.10, 22.21.11', 'Бутылки ПЭТ; Трубы ПНД; Пленка стретч', 'Тара и упаковка из пластика; Полимерные трубы для канализации; Пленки полимерные', false, 82, true, 300000, 'Беларусь, Казахстан, Киргизия');

-- 9. ООО "ТЕКСТИЛЬПРОМ М"
INSERT INTO organizations (
    inn, short_name, full_name, status, legal_address, production_address, 
    additional_site_address, registration_date, director_name,
    management_contact, employee_contact, emergency_contact, website, email,
    msp_status, legal_address_coordinates, production_address_coordinates,
    additional_site_coordinates, latitude, longitude, district, area
) VALUES (
    '7799901234', 'ООО "ТЕКСТИЛЬПРОМ М"', 
    'Общество с ограниченной ответственностью "ТЕКСТИЛЬПРОМ М"', 
    'Действующая', '109544, г. Москва, ул. Большая Андроньевская, д. 23',
    '109544, г. Москва, ул. Большая Андроньевская, д. 23',
    '109544, г. Москва, ул. Вековая, д. 14',
    '2005-08-25', 'Павлова Людмила Николаевна',
    'Директор, Павлова Л.Н., +7 (495) 901-23-45',
    'Мастер смены, Егоров В.С., +7 (495) 901-23-46',
    'Энергетик, Соболев А.М., +7 (495) 901-23-47',
    'http://www.textileprom-m.ru/', 'office@textileprom-m.ru',
    'Малое предприятие', POINT(55.739876, 37.671234), POINT(55.739876, 37.671234),
    POINT(55.742000, 37.675000), 55.739876, 37.671234, 'ЦАО', 'Таганский'
);

INSERT INTO industry_classification (organization_id, main_industry, sub_industry, main_okved, main_okved_description, production_okved)
SELECT id, 'Легкая промышленность', 'Производство текстильных изделий', '13.30', 'Производство ковров и ковровых изделий', '13.30'
FROM organizations WHERE inn = '7799901234';

INSERT INTO financial_indicators (organization_id, year, revenue, net_profit) VALUES
((SELECT id FROM organizations WHERE inn = '7799901234'), 2022, 850000, 25000),
((SELECT id FROM organizations WHERE inn = '7799901234'), 2023, 920000, 30000),
((SELECT id FROM organizations WHERE inn = '7799901234'), 2024, 980000, 35000);

INSERT INTO personnel_indicators (organization_id, year, total_employees, moscow_employees, total_payroll, moscow_payroll, avg_salary_total, avg_salary_moscow) VALUES
((SELECT id FROM organizations WHERE inn = '7799901234'), 2022, 115, 115, 144900, 144900, 105, 105),
((SELECT id FROM organizations WHERE inn = '7799901234'), 2023, 118, 118, 152280, 152280, 107.5, 107.5),
((SELECT id FROM organizations WHERE inn = '7799901234'), 2024, 120, 120, 156000, 156000, 108.3, 108.3);

INSERT INTO tax_payments (organization_id, year, moscow_taxes, profit_tax, property_tax, land_tax, personal_income_tax, transport_tax, other_taxes) VALUES
((SELECT id FROM organizations WHERE inn = '7799901234'), 2022, 38000, 5000, 8000, 400, 18800, 2800, 3000),
((SELECT id FROM organizations WHERE inn = '7799901234'), 2023, 40000, 6000, 8200, 400, 19800, 2900, 2700),
((SELECT id FROM organizations WHERE inn = '7799901234'), 2024, 42000, 7000, 8500, 400, 20300, 2800, 3000);

INSERT INTO investments_export (organization_id, year, investments_moscow, export_volume) VALUES
((SELECT id FROM organizations WHERE inn = '7799901234'), 2022, 20000, 150000),
((SELECT id FROM organizations WHERE inn = '7799901234'), 2023, 25000, 170000),
((SELECT id FROM organizations WHERE inn = '7799901234'), 2024, 30000, 180000);

INSERT INTO real_estate (organization_id, land_cadastral_number, land_area, land_use_type, land_ownership_type, land_owner, building_cadastral_number, building_area, building_use_type, building_type_purpose, building_ownership_type, building_owner, production_area) VALUES
((SELECT id FROM organizations WHERE inn = '7799901234'), '77:01:1409007:667', 2500, 'Для размещения объектов легкой промышленности (4.1)', 'Частная', 'ООО "ТЕКСТИЛЬПРОМ М"', '77:01:1409007:1345', 5000, 'Производственное здание', 'Нежилое, производство', 'Частная', 'ООО "ТЕКСТИЛЬПРОМ М"', 4500);

INSERT INTO products (organization_id, standardized_products, product_types, okpd2_codes, product_segments, product_catalog, has_government_orders, capacity_utilization_percent, has_export, export_volume_previous_year, import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7799901234'), true, 'Ковровые покрытия, Ковры ручной работы, Текстиль для дома', '13.93.11, 13.93.12, 13.92.1', 'Ковер "Восточный узор"; Покрытие ковровое "Офис-Комфорт"; Плед "Домашний"', 'Ковры и ковровые покрытия; Пледы и покрывала; Декоративный текстиль', false, 75, true, 180000, 'Казахстан, Беларусь, Германия');

-- 10. ООО "СПЕЦАВТОМАТИКА"
INSERT INTO organizations (
    inn, short_name, full_name, status, legal_address, production_address, 
    additional_site_address, registration_date, director_name,
    management_contact, employee_contact, emergency_contact, website, email,
    support_measures, msp_status, legal_address_coordinates, 
    production_address_coordinates, additional_site_coordinates,
    latitude, longitude, district, area
) VALUES (
    '7700012345', 'ООО "СПЕЦАВТОМАТИКА"', 
    'Общество с ограниченной ответственностью "СПЕЦАВТОМАТИКА"', 
    'Действующая', '127287, г. Москва, ул. 2-я Хуторская, д. 38А, стр. 15',
    '127287, г. Москва, ул. 2-я Хуторская, д. 38А, стр. 15',
    '127287, г. Москва, ул. Руставели, д. 14',
    '2016-04-10', 'Данилов Артем Павлович',
    'Генеральный директор, Данилов А.П., +7 (495) 012-34-56',
    'Главный конструктор, Жуков И.Л., +7 (495) 012-34-57',
    'Начальник хозяйственного отдела, Чернов М.К., +7 (495) 012-34-58',
    'http://www.specavtomatika.ru/', 'info@specavtomatika.ru',
    'Участие в программе "Кооперация" (Фонд развития промышленности)', 'Среднее предприятие',
    POINT(55.805678, 37.560123), POINT(55.805678, 37.560123), POINT(55.808000, 37.565000),
    55.805678, 37.560123, 'САО', 'Савёловский'
);

INSERT INTO industry_classification (organization_id, main_industry, sub_industry, main_okved, main_okved_description, production_okved)
SELECT id, 'Машиностроение', 'Производство средств автоматизации', '28.30', 'Производство станков, машин и оборудования для обработки металлов и прочих твердых материалов', '28.30'
FROM organizations WHERE inn = '7700012345';

INSERT INTO financial_indicators (organization_id, year, revenue, net_profit) VALUES
((SELECT id FROM organizations WHERE inn = '7700012345'), 2022, 2500000, 200000),
((SELECT id FROM organizations WHERE inn = '7700012345'), 2023, 2750000, 240000),
((SELECT id FROM organizations WHERE inn = '7700012345'), 2024, 3300000, 320000);

INSERT INTO personnel_indicators (organization_id, year, total_employees, moscow_employees, total_payroll, moscow_payroll, avg_salary_total, avg_salary_moscow) VALUES
((SELECT id FROM organizations WHERE inn = '7700012345'), 2022, 300, 300, 486000, 486000, 135, 135),
((SELECT id FROM organizations WHERE inn = '7700012345'), 2023, 305, 305, 512150, 512150, 140, 140),
((SELECT id FROM organizations WHERE inn = '7700012345'), 2024, 310, 310, 537600, 537600, 144.5, 144.5);

INSERT INTO tax_payments (organization_id, year, moscow_taxes, profit_tax, property_tax, land_tax, personal_income_tax, other_taxes) VALUES
((SELECT id FROM organizations WHERE inn = '7700012345'), 2022, 160000, 40000, 25000, 1200, 63200, 30600),
((SELECT id FROM organizations WHERE inn = '7700012345'), 2023, 175000, 48000, 26000, 1200, 66600, 33200),
((SELECT id FROM organizations WHERE inn = '7700012345'), 2024, 185000, 64000, 27000, 1200, 69900, 22900);

INSERT INTO investments_export (organization_id, year, investments_moscow, export_volume) VALUES
((SELECT id FROM organizations WHERE inn = '7700012345'), 2022, 100000, 800000),
((SELECT id FROM organizations WHERE inn = '7700012345'), 2023, 120000, 900000),
((SELECT id FROM organizations WHERE inn = '7700012345'), 2024, 150000, 950000);

INSERT INTO real_estate (organization_id, land_cadastral_number, land_area, land_use_type, land_ownership_type, land_owner, building_cadastral_number, building_area, building_use_type, building_type_purpose, building_ownership_type, building_owner, production_area) VALUES
((SELECT id FROM organizations WHERE inn = '7700012345'), '77:10:1510008:889', 6000, 'Для размещения производственных и административных зданий (4.1)', 'Частная', 'ООО "СПЕЦАВТОМАТИКА"', '77:10:1510008:1567', 10000, 'Производственно-лабораторный корпус', 'Нежилое, производство и НИОКР', 'Частная', 'ООО "СПЕЦАВТОМАТИКА"', 8500);

INSERT INTO products (organization_id, standardized_products, product_types, okpd2_codes, product_segments, product_catalog, has_government_orders, capacity_utilization_percent, has_export, export_volume_previous_year, import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7700012345'), true, 'Системы ЧПУ для станков, Промышленные контроллеры, Роботизированные комплексы', '28.30.11, 28.30.12, 28.99.1', 'Система ЧПУ "СА-05"; Контроллер промышленный "КП-100"; Роботизированный комплекс "РК-Сварка"', 'Системы числового программного управления; Промышленные контроллеры и датчики; Робототехнические комплексы', true, 87, true, 950000, 'Индия, Китай, Турция');

-- 1. АО "СВОБОДА"
INSERT INTO export_history (organization_id, year, export_volume, main_import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7714431171'), 2022, 350000, 'Казахстан, Беларусь, Армения'),
((SELECT id FROM organizations WHERE inn = '7714431171'), 2023, 420000, 'Казахстан, Беларусь, Армения, Узбекистан'),
((SELECT id FROM organizations WHERE inn = '7714431171'), 2024, 500000, 'Казахстан, Беларусь, Армения, Узбекистан');

-- 2. ООО "Московский Машиностроительный Завод "ЗАРЯ"
INSERT INTO export_history (organization_id, year, export_volume, main_import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7722567890'), 2022, 900000, 'Индия, Турция'),
((SELECT id FROM organizations WHERE inn = '7722567890'), 2023, 1050000, 'Индия, Турция, Египет'),
((SELECT id FROM organizations WHERE inn = '7722567890'), 2024, 1200000, 'Индия, Турция, Египет');

-- 3. АО "ЭЛЕКТРОСИЛА"
INSERT INTO export_history (organization_id, year, export_volume, main_import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7733312345'), 2022, 2800000, 'Китай, Вьетнам'),
((SELECT id FROM organizations WHERE inn = '7733312345'), 2023, 3200000, 'Китай, Вьетнам, Иран'),
((SELECT id FROM organizations WHERE inn = '7733312345'), 2024, 3500000, 'Китай, Вьетнам, Иран');

-- 4. ООО "МОСПИЩЕПРОМ"
INSERT INTO export_history (organization_id, year, export_volume, main_import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7744456789'), 2022, 120000, 'Казахстан, Беларусь'),
((SELECT id FROM organizations WHERE inn = '7744456789'), 2023, 140000, 'Казахстан, Беларусь, Азербайджан'),
((SELECT id FROM organizations WHERE inn = '7744456789'), 2024, 150000, 'Казахстан, Беларусь, Азербайджан');

-- 5. ЗАО "МЕТАЛЛООБРАБОТКА"
INSERT INTO export_history (organization_id, year, export_volume, main_import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7755567890'), 2022, 70000, 'Беларусь'),
((SELECT id FROM organizations WHERE inn = '7755567890'), 2023, 75000, 'Беларусь, Абхазия'),
((SELECT id FROM organizations WHERE inn = '7755567890'), 2024, 80000, 'Беларусь, Абхазия');

-- 6. ООО "НАУЧПРИБОР"
INSERT INTO export_history (organization_id, year, export_volume, main_import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7766678901'), 2022, 300000, 'Германия, Южная Корея'),
((SELECT id FROM organizations WHERE inn = '7766678901'), 2023, 400000, 'Германия, Южная Корея, Израиль'),
((SELECT id FROM organizations WHERE inn = '7766678901'), 2024, 450000, 'Германия, Южная Корея, Израиль');

-- 7. АО "МОСФАРМ"
INSERT INTO export_history (organization_id, year, export_volume, main_import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7777789012'), 2022, 4500000, 'Казахстан, Беларусь, Вьетнам'),
((SELECT id FROM organizations WHERE inn = '7777789012'), 2023, 5200000, 'Казахстан, Беларусь, Вьетнам, Сербия'),
((SELECT id FROM organizations WHERE inn = '7777789012'), 2024, 5800000, 'Казахстан, Беларусь, Вьетнам, Сербия, ОАЭ');

-- 8. ООО "ПОЛИМЕРТЕХ"
INSERT INTO export_history (organization_id, year, export_volume, main_import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7788890123'), 2022, 250000, 'Беларусь, Казахстан'),
((SELECT id FROM organizations WHERE inn = '7788890123'), 2023, 280000, 'Беларусь, Казахстан, Киргизия'),
((SELECT id FROM organizations WHERE inn = '7788890123'), 2024, 300000, 'Беларусь, Казахстан, Киргизия');

-- 9. ООО "ТЕКСТИЛЬПРОМ М"
INSERT INTO export_history (organization_id, year, export_volume, main_import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7799901234'), 2022, 150000, 'Казахстан, Беларусь'),
((SELECT id FROM organizations WHERE inn = '7799901234'), 2023, 170000, 'Казахстан, Беларусь, Германия'),
((SELECT id FROM organizations WHERE inn = '7799901234'), 2024, 180000, 'Казахстан, Беларусь, Германия');

-- 10. ООО "СПЕЦАВТОМАТИКА"
INSERT INTO export_history (organization_id, year, export_volume, main_import_countries) VALUES
((SELECT id FROM organizations WHERE inn = '7700012345'), 2022, 800000, 'Индия, Китай'),
((SELECT id FROM organizations WHERE inn = '7700012345'), 2023, 900000, 'Индия, Китай, Турция'),
((SELECT id FROM organizations WHERE inn = '7700012345'), 2024, 950000, 'Индия, Китай, Турция');
