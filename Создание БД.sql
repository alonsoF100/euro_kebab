

-- 1. Основная таблица организаций
CREATE TABLE organizations (
    id SERIAL PRIMARY KEY,
    inn VARCHAR(12) UNIQUE NOT NULL,
    short_name VARCHAR(500) NOT NULL,
    full_name VARCHAR(1000) NOT NULL,
    status VARCHAR(100) NOT NULL DEFAULT 'Действующая',
    legal_address VARCHAR(1000) NOT NULL,
    production_address VARCHAR(1000),
    additional_site_address VARCHAR(1000),
    registration_date DATE,
    director_name VARCHAR(300),
    parent_organization VARCHAR(500),
    parent_inn VARCHAR(12),
    management_contact VARCHAR(500),
    employee_contact VARCHAR(500),
    emergency_contact VARCHAR(500),
    website VARCHAR(500),
    email VARCHAR(300),
    support_measures TEXT,
    special_status VARCHAR(300),
    msp_status VARCHAR(100) NOT NULL,
    
    -- Координаты
    legal_address_coordinates POINT,
    production_address_coordinates POINT,
    additional_site_coordinates POINT,
    latitude NUMERIC(10,6),
    longitude NUMERIC(10,6),
    
    -- Административное деление
    district VARCHAR(100),
    area VARCHAR(100),
    
    -- Технические поля
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Таблица отраслевой классификации
CREATE TABLE industry_classification (
    id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    main_industry VARCHAR(300) NOT NULL,
    sub_industry VARCHAR(300),
    main_okved VARCHAR(20) NOT NULL,
    main_okved_description VARCHAR(500),
    production_okved VARCHAR(20),
    
    UNIQUE(organization_id)
);

-- 3. Таблица финансовых показателей по годам
CREATE TABLE financial_indicators (
    id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    year INTEGER NOT NULL CHECK (year BETWEEN 2000 AND 2100),
    revenue NUMERIC(15,2),
    net_profit NUMERIC(15,2),
    
    UNIQUE(organization_id, year)
);

-- 4. Таблица кадровых показателей по годам
CREATE TABLE personnel_indicators (
    id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    year INTEGER NOT NULL CHECK (year BETWEEN 2000 AND 2100),
    
    -- Общая численность
    total_employees INTEGER,
    moscow_employees INTEGER,
    
    -- Фонд оплаты труда
    total_payroll NUMERIC(15,2),
    moscow_payroll NUMERIC(15,2),
    
    -- Средняя зарплата
    avg_salary_total NUMERIC(10,2),
    avg_salary_moscow NUMERIC(10,2),
    
    UNIQUE(organization_id, year)
);

-- 5. Таблица налоговых платежей по годам
CREATE TABLE tax_payments (
    id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    year INTEGER NOT NULL CHECK (year BETWEEN 2000 AND 2100),
    
    -- Общие налоги в бюджет Москвы
    moscow_taxes NUMERIC(15,2),
    
    -- Детализация налогов
    profit_tax NUMERIC(15,2),
    property_tax NUMERIC(15,2),
    land_tax NUMERIC(15,2),
    personal_income_tax NUMERIC(15,2),
    transport_tax NUMERIC(15,2),
    other_taxes NUMERIC(15,2),
    excise_tax NUMERIC(15,2),
    
    UNIQUE(organization_id, year)
);

-- 6. Таблица инвестиций и экспорта по годам
CREATE TABLE investments_export (
    id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    year INTEGER NOT NULL CHECK (year BETWEEN 2000 AND 2100),
    
    investments_moscow NUMERIC(15,2),
    export_volume NUMERIC(15,2),
    
    UNIQUE(organization_id, year)
);

-- 7. Таблица недвижимости и земельных участков
CREATE TABLE real_estate (
    id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    
    -- Земельный участок
    land_cadastral_number VARCHAR(100),
    land_area NUMERIC(10,2),
    land_use_type VARCHAR(500),
    land_ownership_type VARCHAR(200),
    land_owner VARCHAR(500),
    
    -- Объекты капитального строительства
    building_cadastral_number VARCHAR(100),
    building_area NUMERIC(10,2),
    building_use_type VARCHAR(500),
    building_type_purpose VARCHAR(500),
    building_ownership_type VARCHAR(200),
    building_owner VARCHAR(500),
    
    -- Производственные помещения
    production_area NUMERIC(10,2),
    
    UNIQUE(organization_id)
);

-- 8. Таблица производимой продукции
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    
    standardized_products BOOLEAN,
    product_types TEXT,
    okpd2_codes TEXT,
    product_segments TEXT,
    product_catalog TEXT,
    
    -- Производственная деятельность
    has_government_orders BOOLEAN,
    capacity_utilization_percent INTEGER,
    has_export BOOLEAN,
    export_volume_previous_year NUMERIC(15,2),
    import_countries TEXT,
    
    UNIQUE(organization_id)
);

-- 9. Таблица для хранения истории экспорта по годам (если нужна детализация)
CREATE TABLE export_history (
    id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    year INTEGER NOT NULL CHECK (year BETWEEN 2000 AND 2100),
    export_volume NUMERIC(15,2),
    main_import_countries TEXT,
    
    UNIQUE(organization_id, year)
);

-- ИНДЕКСЫ для оптимизации запросов

-- Для организаций
CREATE INDEX idx_organizations_inn ON organizations(inn);
CREATE INDEX idx_organizations_status ON organizations(status);
CREATE INDEX idx_organizations_msp_status ON organizations(msp_status);
CREATE INDEX idx_organizations_district ON organizations(district);

-- Для финансовых показателей
CREATE INDEX idx_financial_org_year ON financial_indicators(organization_id, year);
CREATE INDEX idx_financial_year ON financial_indicators(year);
CREATE INDEX idx_financial_revenue ON financial_indicators(revenue) WHERE revenue IS NOT NULL;

-- Для кадровых показателей
CREATE INDEX idx_personnel_org_year ON personnel_indicators(organization_id, year);
CREATE INDEX idx_personnel_year ON personnel_indicators(year);

-- Для налогов
CREATE INDEX idx_taxes_org_year ON tax_payments(organization_id, year);

-- ФУНКЦИИ и ТРИГГЕРЫ

-- Функция для обновления updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Триггер для организаций
CREATE TRIGGER update_organizations_updated_at 
    BEFORE UPDATE ON organizations 
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();

-- ПРЕДСТАВЛЕНИЯ для удобства анализа

-- Сводка по организациям с последними показателями
CREATE VIEW organizations_current_summary AS
SELECT 
    o.id,
    o.inn,
    o.short_name,
    o.full_name,
    o.status,
    ic.main_industry,
    ic.sub_industry,
    f_2024.revenue as revenue_2024,
    f_2024.net_profit as net_profit_2024,
    p_2024.total_employees as employees_2024,
    p_2024.avg_salary_moscow as avg_salary_2024,
    pr.capacity_utilization_percent,
    pr.has_export,
    ie_2024.export_volume as export_volume_2024,
    o.district,
    o.area
FROM organizations o
LEFT JOIN industry_classification ic ON o.id = ic.organization_id
LEFT JOIN financial_indicators f_2024 ON o.id = f_2024.organization_id AND f_2024.year = 2024
LEFT JOIN personnel_indicators p_2024 ON o.id = p_2024.organization_id AND p_2024.year = 2024
LEFT JOIN investments_export ie_2024 ON o.id = ie_2024.organization_id AND ie_2024.year = 2024
LEFT JOIN products pr ON o.id = pr.organization_id
WHERE o.status = 'Действующая';

-- Финансовая динамика по годам
CREATE VIEW financial_dynamics AS
SELECT 
    o.id,
    o.inn,
    o.short_name,
    f.year,
    f.revenue,
    f.net_profit,
    CASE 
        WHEN LAG(f.revenue) OVER (PARTITION BY o.id ORDER BY f.year) > 0 
        THEN ROUND(((f.revenue - LAG(f.revenue) OVER (PARTITION BY o.id ORDER BY f.year)) / 
                   LAG(f.revenue) OVER (PARTITION BY o.id ORDER BY f.year) * 100), 2)
        ELSE NULL 
    END as revenue_growth_percent
FROM organizations o
JOIN financial_indicators f ON o.id = f.organization_id
WHERE o.status = 'Действующая'
ORDER BY o.id, f.year;

-- КОММЕНТАРИИ к таблицам
COMMENT ON TABLE organizations IS 'Основные реквизиты организаций';
COMMENT ON TABLE financial_indicators IS 'Финансовые показатели по годам';
COMMENT ON TABLE personnel_indicators IS 'Кадровые показатели по годам';
COMMENT ON TABLE tax_payments IS 'Налоговые платежи по годам';
COMMENT ON TABLE products IS 'Информация о производимой продукции';
