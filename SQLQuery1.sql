Select *
from PortfolioProject.dbo.Sheet1$_xlnm#_FilterDatabase
order by 3,4

Select *
from PortfolioProject..Sheet1$
order by 3,4

--select data that will going to use

Select Location, date, total_cases, new_cases, total_deaths, population From PortfolioProject..Sheet1$
order by 1,2


--looking at totalcases vs total deaths



--show likelihood of dying if you contract covid in your country
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..Sheet1$_xlnm#_FilterDatabase where location like '%state%'
order by 1,2


--looking at the total cases vs the population
--show population got covid

Select Location, date, total_cases, total_deaths,Population, (total_deaths/Population)*100 as Population_got_covid
From PortfolioProject..Sheet1$_xlnm#_FilterDatabase where location like '%state%'
order by 1,2


--what country had the hight infection rate comper to the population


Select Location, Population, Max(total_cases) as Hight_infection, Max( (total_deaths/Population))*100 as Most_country_infection
From PortfolioProject..Sheet1$_xlnm#_FilterDatabase 
Group by Location, Population
order by Most_country_infection desc

--showing countries with hight deaths

Select Location, Population, Max(cast(total_deaths as int) ) as Total_death
From PortfolioProject..Sheet1$_xlnm#_FilterDatabase 
where continent is not null
Group by Location, Population
order by Total_death desc

--Lets break thing down by continent
Select continent,Max(cast(total_deaths as int) ) as Total_death
From PortfolioProject..Sheet1$_xlnm#_FilterDatabase 
where continent is not null
Group by continent
order by Total_death desc

--Try location
Select Location,Max(cast(total_deaths as int) ) as Total_death
From PortfolioProject..Sheet1$_xlnm#_FilterDatabase 
where continent is  null
Group by Location
order by Total_death desc

--showing the continent with most deaths count per population
--Task

--GLOBAL NUMBER
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as deaths_pourcentage
From PortfolioProject..Sheet1$_xlnm#_FilterDatabase
where continent is not null
order by 1,2

-- looking the total vaccination vs population


 --Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
 --, SUM(CONVERT(int, vac.new_vaccinations)) OVER (Partition by dea.Location) From PortfolioProject..Sheet1$_xlnm#_FilterDatabase dea
 --join PortfolioProject..Sheet1$ vac
 --on dea.location =vac.location
 --and dea.date= vac.date
 --where dea.continent is not null
 --order by 2,3

 --WORK ON HOW TO CREATE VIEWS

 --creating vue to store data to later visualisation
 --create View PercentPopulationVaccinated as
 --Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
 --, SUM(CONVERT(int, vac.new_vaccinations)) OVER (Partition by dea.Location) From PortfolioProject..Sheet1$_xlnm#_FilterDatabase dea
 --join PortfolioProject..Sheet1$ vac
 --on dea.location =vac.location
 --and dea.date= vac.date
 --where dea.continent is not null
 --order by 2,3
