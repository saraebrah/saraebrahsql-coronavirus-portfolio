-- Select Data that we are going to be starting with
Select "location", "date", total_cases, new_cases, total_deaths, new_deaths, population
From death_table
order by 1,2;



-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country
Select "location", "date", total_cases, total_deaths, 100*(total_deaths/total_cases) As death_percentage
From death_table
Where "location" = 'Canada'
order by 1,2;



-- Total Cases vs Population
-- Shows what percentage of population infected with Covid
Select "location", "date", population, total_cases, 100*(total_cases/population) As percent_population_infected
From death_table
Where "location" = 'Canada'
order by 1,2;



-- Countries with Highest Infection Rate compared to Population
Select "location", population, MAX(total_cases) As highest_infection_cases, MAX(100*(total_cases/population)) As percent_population_infected
From death_table
Group By "location", population
order by percent_population_infected Desc;



-- Countries with Highest Death Count per Population
Select "location", MAX(total_deaths) As highest_death_counts
From death_table
Where continent is not null 
Group By "location"
order by highest_death_counts Desc;



-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population
Select continent, MAX(total_deaths) As highest_death_counts
From death_table
Where continent is not null 
Group By continent
order by highest_death_counts Desc;

Select "location", MAX(total_deaths) As highest_death_counts
From death_table
Where continent is null 
Group By "location"
order by highest_death_counts Desc;



-- GLOBAL NUMBERS
Select "date", Sum(new_cases) As total_cases, Sum(new_deaths) As total_deaths, 100*(Sum(new_deaths)/Sum(new_cases)) As death_percentage
From death_table
Where continent is not null 
Group By "date"
order by 1,2;

Select Sum(new_cases) As total_cases, Sum(new_deaths) As total_deaths, 100*(Sum(new_deaths)/Sum(new_cases)) As death_percentage
From death_table
Where continent is not null 
order by 1,2;



-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine
Select de.continent, de.location, de.date, de.population, va.new_vaccinations,
	Sum(va.new_vaccinations) over (Partition By de.location Order By de.location, de.date) As rolling_people_vaccinated
	--, (rolling_people_vaccinated/population)*100
From death_table de
Join vaccin_table va
On de.location = va.location And de.date = va.date
Where de.continent is not null 
order by 2,3;



-- Using CTE to perform Calculation on Partition By in previous query
With PopvsVac (Continent, "location", "date", population, new_vaccinations, rolling_people_vaccinated)
as
(
	Select de.continent, de.location, de.date, de.population, va.new_vaccinations,
	Sum(va.new_vaccinations) over (Partition By de.location Order By de.location, de.date) As rolling_people_vaccinated
	--, (rolling_people_vaccinated/population)*100
	From death_table de
	Join vaccin_table va
	On de.location = va.location And de.date = va.date
	Where de.continent is not null 
)
Select *, (rolling_people_vaccinated/population)*100
From PopvsVac;



-- Using Temp Table to perform Calculation on Partition By in previous query
DROP Table if exists percent_population_vaccinated;
Create Table percent_population_vaccinated
(
continent varchar(255),
"location" varchar(255),
"date" date,
population numeric,
new_vaccinations numeric,
rolling_people_vaccinated numeric
);

Insert into percent_population_vaccinated
Select de.continent, de.location, de.date, de.population, va.new_vaccinations,
	Sum(va.new_vaccinations) over (Partition By de.location Order By de.location, de.date) As rolling_people_vaccinated
	--, (rolling_people_vaccinated/population)*100
From death_table de
Join vaccin_table va
On de.location = va.location And de.date = va.date
Where de.continent is not null;
Select *, (rolling_people_vaccinated/Population)*100
From percent_population_vaccinated;



-- Creating View to store data for later visualizations
Create View v_percent_population_vaccinated as
Select de.continent, de.location, de.date, de.population, va.new_vaccinations,
	Sum(va.new_vaccinations) over (Partition By de.location Order By de.location, de.date) As rolling_people_vaccinated
	--, (rolling_people_vaccinated/population)*100
From death_table de
Join vaccin_table va
On de.location = va.location And de.date = va.date
Where de.continent is not null

