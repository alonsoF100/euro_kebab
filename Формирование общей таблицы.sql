with table_moscow as (
SELECT 
    ROW_NUMBER() OVER (ORDER BY o.id) AS "№",
    o.inn AS "ИНН",
    o.short_name AS "Наименование организации",
    o.full_name AS "Полное наименование организации",
    o.status AS "Статус",
    o.legal_address AS "Юридический адрес",
    o.production_address AS "Адрес производства",
    o.additional_site_address AS "Адрес дополнительной площадки",
    ic.main_industry AS "Основная отрасль",
    ic.sub_industry AS "Подотрасль (Основная)",
    ic.main_okved AS "Основной ОКВЭД",
    ic.main_okved_description AS "Вид деятельности по основному ОКВЭД",
    ic.production_okved AS "Производственный ОКВЭД",
    o.registration_date AS "Дата регистрации",
    o.director_name AS "Руководитель",
    o.parent_organization AS "Головная организация",
    o.parent_inn AS "ИНН головной организации",
    o.management_contact AS "Контактные данные руководства",
    o.employee_contact AS "Контакт сотрудника организации",
    o.emergency_contact AS "Контактные данные ответственного по ЧС",
    o.website AS "Сайт",
    o.email AS "Электронная почта",
    o.support_measures AS "Данные об оказанных мерах поддержки",
    o.special_status AS "Наличие особого статуса",
    o.msp_status AS "Статус МСП",
    
    -- Финансовые показатели
    f_2022.revenue AS "Выручка предприятия (2022), тыс. руб.",
    f_2023.revenue AS "Выручка предприятия (2023), тыс. руб.",
    f_2024.revenue AS "Выручка предприятия (2024), тыс. руб.",
    f_2022.net_profit AS "Чистая прибыль (убыток) (2022), тыс. руб.",
    f_2023.net_profit AS "Чистая прибыль (убыток) (2023), тыс. руб.",
    f_2024.net_profit AS "Чистая прибыль (убыток) (2024), тыс. руб.",

    -- Численность персонала (всего)
    p_2022.total_employees AS "Среднесписочная численность персонала (2022, всего), чел",
    p_2023.total_employees AS "Среднесписочная численность персонала (2023, всего), чел",
    p_2024.total_employees AS "Среднесписочная численность персонала (2024, всего), чел",

    -- Численность персонала (Москва)
    p_2022.moscow_employees AS "Среднесписочная численность персонала (2022, Москва), чел",
    p_2023.moscow_employees AS "Среднесписочная численность персонала (2023, Москва), чел",
    p_2024.moscow_employees AS "Среднесписочная численность персонала (2024, Москва), чел",

    -- Фонд оплаты труда
    p_2022.total_payroll AS "Фонд оплаты труда (2022, всего), тыс. руб.",
    p_2023.total_payroll AS "Фонд оплаты труда (2023, всего), тыс. руб.",
    p_2024.total_payroll AS "Фонд оплаты труда (2024, всего), тыс. руб.",
    p_2022.moscow_payroll AS "Фонд оплаты труда (2022, Москва), тыс. руб.",
    p_2023.moscow_payroll AS "Фонд оплаты труда (2023, Москва), тыс. руб.",
    p_2024.moscow_payroll AS "Фонд оплаты труда (2024, Москва), тыс. руб.",

    -- Средняя зарплата
    p_2022.avg_salary_total AS "Средняя зарплата (2022, всего), тыс. руб.",
    p_2023.avg_salary_total AS "Средняя зарплата (2023, всего), тыс. руб.",
    p_2024.avg_salary_total AS "Средняя зарплата (2024, всего), тыс. руб.",
    p_2022.avg_salary_moscow AS "Средняя зарплата (2022, Москва), тыс. руб.",
    p_2023.avg_salary_moscow AS "Средняя зарплата (2023, Москва), тыс. руб.",
    p_2024.avg_salary_moscow AS "Средняя зарплата (2024, Москва), тыс. руб.",

    -- Налоги
    t_2022.moscow_taxes AS "Налоги в бюджет Москвы (2022), тыс. руб.",
    t_2023.moscow_taxes AS "Налоги в бюджет Москвы (2023), тыс. руб.",
    t_2024.moscow_taxes AS "Налоги в бюджет Москвы (2024), тыс. руб.",
    t_2022.profit_tax AS "Налог на прибыль (2022), тыс. руб.",
    t_2023.profit_tax AS "Налог на прибыль (2023), тыс. руб.",
    t_2024.profit_tax AS "Налог на прибыль (2024), тыс. руб.",
    t_2022.property_tax AS "Налог на имущество (2022), тыс. руб.",
    t_2023.property_tax AS "Налог на имущество (2023), тыс. руб.",
    t_2024.property_tax AS "Налог на имущество (2024), тыс. руб.",
    t_2022.land_tax AS "Налог на землю (2022), тыс. руб.",
    t_2023.land_tax AS "Налог на землю (2023), тыс. руб.",
    t_2024.land_tax AS "Налог на землю (2024), тыс. руб.",
    t_2022.personal_income_tax AS "НДФЛ (2022), тыс. руб.",
    t_2023.personal_income_tax AS "НДФЛ (2023), тыс. руб.",
    t_2024.personal_income_tax AS "НДФЛ (2024), тыс. руб.",
    t_2022.transport_tax AS "Транспортный налог (2022), тыс. руб.",
    t_2023.transport_tax AS "Транспортный налог (2023), тыс. руб.",
    t_2024.transport_tax AS "Транспортный налог (2024), тыс. руб.",
    t_2022.other_taxes AS "Прочие налоги (2022), тыс. руб.",
    t_2023.other_taxes AS "Прочие налоги (2023), тыс. руб.",
    t_2024.other_taxes AS "Прочие налоги (2024), тыс. руб.",
    t_2022.excise_tax AS "Акцизы (2022), тыс. руб.",
    t_2023.excise_tax AS "Акцизы (2023), тыс. руб.",
    t_2024.excise_tax AS "Акцизы (2024), тыс. руб.",

    -- Инвестиции и экспорт
    ie_2022.investments_moscow AS "Инвестиции в Москву (2022), тыс. руб.",
    ie_2023.investments_moscow AS "Инвестиции в Москву (2023), тыс. руб.",
    ie_2024.investments_moscow AS "Инвестиции в Москву (2024), тыс. руб.",
    ie_2022.export_volume AS "Объем экспорта (2022), тыс. руб.",
    ie_2023.export_volume AS "Объем экспорта (2023), тыс. руб.",
    ie_2024.export_volume AS "Объем экспорта (2024), тыс. руб.",

    -- Недвижимость
    re.land_cadastral_number AS "Кадастровый номер ЗУ",
    re.land_area AS "Площадь ЗУ, кв.м",
    re.land_use_type AS "Вид использования ЗУ",
    re.land_ownership_type AS "Тип собственности ЗУ",
    re.land_owner AS "Собственник ЗУ",
    re.building_cadastral_number AS "Кадастровый номер ОКС",
    re.building_area AS "Площадь ОКС, кв.м",
    re.building_use_type AS "Вид использования ОКС",
    re.building_type_purpose AS "Тип строения",
    re.building_ownership_type AS "Тип собственности ОКС",
    re.building_owner AS "Собственник ОКС",
    re.production_area AS "Площадь производственных помещений, кв.м",

    -- Продукция
    CASE WHEN pr.standardized_products THEN 'Да' ELSE 'Нет' END AS "Стандартизированная продукция",
    pr.product_types AS "Виды продукции",
    pr.okpd2_codes AS "Коды ОКПД 2",
    pr.product_segments AS "Сегменты продукции",
    pr.product_catalog AS "Каталог продукции",
    CASE WHEN pr.has_government_orders THEN 'Да' ELSE 'Нет' END AS "Наличие госзаказа",
    pr.capacity_utilization_percent AS "Загрузка мощностей, %",
    CASE WHEN pr.has_export THEN 'Да' ELSE 'Нет' END AS "Наличие экспорта",
    pr.export_volume_previous_year AS "Объем экспорта за прошлый год, млн руб.",
    pr.import_countries AS "Страны-импортёры",

    -- Координаты
    o.legal_address_coordinates AS "Координаты юр. адреса",
    o.production_address_coordinates AS "Координаты адреса производства",
    o.additional_site_coordinates AS "Координаты доп. площадки",
    o.latitude AS "Широта",
    o.longitude AS "Долгота",
    o.district AS "Округ",
    o.area AS "Район"

FROM organizations o
LEFT JOIN industry_classification ic ON o.id = ic.organization_id
LEFT JOIN financial_indicators f_2022 ON o.id = f_2022.organization_id AND f_2022.year = 2022
LEFT JOIN financial_indicators f_2023 ON o.id = f_2023.organization_id AND f_2023.year = 2023
LEFT JOIN financial_indicators f_2024 ON o.id = f_2024.organization_id AND f_2024.year = 2024
LEFT JOIN personnel_indicators p_2022 ON o.id = p_2022.organization_id AND p_2022.year = 2022
LEFT JOIN personnel_indicators p_2023 ON o.id = p_2023.organization_id AND p_2023.year = 2023
LEFT JOIN personnel_indicators p_2024 ON o.id = p_2024.organization_id AND p_2024.year = 2024
LEFT JOIN tax_payments t_2022 ON o.id = t_2022.organization_id AND t_2022.year = 2022
LEFT JOIN tax_payments t_2023 ON o.id = t_2023.organization_id AND t_2023.year = 2023
LEFT JOIN tax_payments t_2024 ON o.id = t_2024.organization_id AND t_2024.year = 2024
LEFT JOIN investments_export ie_2022 ON o.id = ie_2022.organization_id AND ie_2022.year = 2022
LEFT JOIN investments_export ie_2023 ON o.id = ie_2023.organization_id AND ie_2023.year = 2023
LEFT JOIN investments_export ie_2024 ON o.id = ie_2024.organization_id AND ie_2024.year = 2024
LEFT JOIN real_estate re ON o.id = re.organization_id
LEFT JOIN products pr ON o.id = pr.organization_id
)

select * from table_moscow
