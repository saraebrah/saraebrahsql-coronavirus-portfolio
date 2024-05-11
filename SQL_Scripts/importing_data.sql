CREATE TABLE death_table (
    iso_code TEXT,
    continent TEXT,
    "location" TEXT,
    "date" DATE,
    population NUMERIC,
    total_cases NUMERIC,
    new_cases NUMERIC,
    new_cases_smoothed NUMERIC,
    total_deaths NUMERIC,
    new_deaths NUMERIC,
    new_deaths_smoothed NUMERIC,
    total_cases_per_million NUMERIC,
    new_cases_per_million NUMERIC,
    new_cases_smoothed_per_million NUMERIC,
    total_deaths_per_million NUMERIC,
    new_deaths_per_million NUMERIC,
    new_deaths_smoothed_per_million NUMERIC,
    reproduction_rate NUMERIC,
    icu_patients NUMERIC,
    icu_patients_per_million NUMERIC,
    hosp_patients NUMERIC,
    hosp_patients_per_million NUMERIC,
    weekly_icu_admissions NUMERIC,
    weekly_icu_admissions_per_million NUMERIC,
    weekly_hosp_admissions NUMERIC,
    weekly_hosp_admissions_per_million NUMERIC
);

-- Run the following in psql: 
-- \COPY death_table FROM 'C:/Users/ASUS/OneDrive - University of Waterloo/Tutorials/SQL/saraebrahsql-coronavirus-portfolio/CovidDeaths.csv' DELIMITER ',' CSV HEADER

select * from death_table


CREATE TABLE vaccin_table (
    iso_code TEXT,
    continent TEXT,
    "location" TEXT,
    "date" DATE,
    new_tests INTEGER,
    total_tests INTEGER,
    total_tests_per_thousand NUMERIC,
    new_tests_per_thousand NUMERIC,
    new_tests_smoothed INTEGER,
    new_tests_smoothed_per_thousand NUMERIC,
    positive_rate NUMERIC,
    tests_per_case NUMERIC,
    tests_units TEXT,
    total_vaccinations INTEGER,
    people_vaccinated INTEGER,
    people_fully_vaccinated INTEGER,
    new_vaccinations INTEGER,
    new_vaccinations_smoothed INTEGER,
    total_vaccinations_per_hundred NUMERIC,
    people_vaccinated_per_hundred NUMERIC,
    people_fully_vaccinated_per_hundred NUMERIC,
    new_vaccinations_smoothed_per_million NUMERIC,
    stringency_index NUMERIC,
    population_density NUMERIC,
    median_age NUMERIC,
    aged_65_older NUMERIC,
    aged_70_older NUMERIC,
    gdp_per_capita NUMERIC,
    extreme_poverty NUMERIC,
    cardiovasc_death_rate NUMERIC,
    diabetes_prevalence NUMERIC,
    female_smokers NUMERIC,
    male_smokers NUMERIC,
    handwashing_facilities NUMERIC,
    hospital_beds_per_thousand NUMERIC,
    life_expectancy NUMERIC,
    human_development_index NUMERIC
);

-- Run the following in psql:
-- \COPY vaccin_table FROM 'C:/Users/ASUS/OneDrive - University of Waterloo/Tutorials/SQL/saraebrahsql-coronavirus-portfolio/CovidVaccinations.csv' DELIMITER ',' CSV HEADER

select * from vaccin_table