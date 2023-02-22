class HomeModal {
  List<CountriesStat>? countriesStat;
  String? statisticTakenAt;
  WorldTotal? worldTotal;

  HomeModal({this.countriesStat, this.statisticTakenAt, this.worldTotal});

  HomeModal.fromJson(Map<String, dynamic> json) {
    if (json['countries_stat'] != null) {
      countriesStat = <CountriesStat>[];
      json['countries_stat'].forEach((v) {
        countriesStat!.add(new CountriesStat.fromJson(v));
      });
    }
    statisticTakenAt = json['statistic_taken_at'];
    worldTotal = json['world_total'] != null
        ? new WorldTotal.fromJson(json['world_total'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countriesStat != null) {
      data['countries_stat'] =
          this.countriesStat!.map((v) => v.toJson()).toList();
    }
    data['statistic_taken_at'] = this.statisticTakenAt;
    if (this.worldTotal != null) {
      data['world_total'] = this.worldTotal!.toJson();
    }
    return data;
  }
}

class CountriesStat {
  String? countryName;
  String? cases;
  String? deaths;
  String? region;
  String? totalRecovered;
  String? newDeaths;
  String? newCases;
  String? seriousCritical;
  String? activeCases;
  String? totalCasesPer1mPopulation;
  String? deathsPer1mPopulation;
  String? totalTests;
  String? testsPer1mPopulation;

  CountriesStat(
      {this.countryName,
      this.cases,
      this.deaths,
      this.region,
      this.totalRecovered,
      this.newDeaths,
      this.newCases,
      this.seriousCritical,
      this.activeCases,
      this.totalCasesPer1mPopulation,
      this.deathsPer1mPopulation,
      this.totalTests,
      this.testsPer1mPopulation});

  CountriesStat.fromJson(Map<String, dynamic> json) {
    countryName = json['country_name'];
    cases = json['cases'];
    deaths = json['deaths'];
    region = json['region'];
    totalRecovered = json['total_recovered'];
    newDeaths = json['new_deaths'];
    newCases = json['new_cases'];
    seriousCritical = json['serious_critical'];
    activeCases = json['active_cases'];
    totalCasesPer1mPopulation = json['total_cases_per_1m_population'];
    deathsPer1mPopulation = json['deaths_per_1m_population'];
    totalTests = json['total_tests'];
    testsPer1mPopulation = json['tests_per_1m_population'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_name'] = this.countryName;
    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    data['region'] = this.region;
    data['total_recovered'] = this.totalRecovered;
    data['new_deaths'] = this.newDeaths;
    data['new_cases'] = this.newCases;
    data['serious_critical'] = this.seriousCritical;
    data['active_cases'] = this.activeCases;
    data['total_cases_per_1m_population'] = this.totalCasesPer1mPopulation;
    data['deaths_per_1m_population'] = this.deathsPer1mPopulation;
    data['total_tests'] = this.totalTests;
    data['tests_per_1m_population'] = this.testsPer1mPopulation;
    return data;
  }
}

class WorldTotal {
  String? totalCases;
  String? newCases;
  String? totalDeaths;
  String? newDeaths;
  String? totalRecovered;
  String? activeCases;
  String? seriousCritical;
  String? totalCasesPer1mPopulation;
  String? deathsPer1mPopulation;
  String? statisticTakenAt;

  WorldTotal(
      {this.totalCases,
      this.newCases,
      this.totalDeaths,
      this.newDeaths,
      this.totalRecovered,
      this.activeCases,
      this.seriousCritical,
      this.totalCasesPer1mPopulation,
      this.deathsPer1mPopulation,
      this.statisticTakenAt});

  WorldTotal.fromJson(Map<String, dynamic> json) {
    totalCases = json['total_cases'];
    newCases = json['new_cases'];
    totalDeaths = json['total_deaths'];
    newDeaths = json['new_deaths'];
    totalRecovered = json['total_recovered'];
    activeCases = json['active_cases'];
    seriousCritical = json['serious_critical'];
    totalCasesPer1mPopulation = json['total_cases_per_1m_population'];
    deathsPer1mPopulation = json['deaths_per_1m_population'];
    statisticTakenAt = json['statistic_taken_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_cases'] = this.totalCases;
    data['new_cases'] = this.newCases;
    data['total_deaths'] = this.totalDeaths;
    data['new_deaths'] = this.newDeaths;
    data['total_recovered'] = this.totalRecovered;
    data['active_cases'] = this.activeCases;
    data['serious_critical'] = this.seriousCritical;
    data['total_cases_per_1m_population'] = this.totalCasesPer1mPopulation;
    data['deaths_per_1m_population'] = this.deathsPer1mPopulation;
    data['statistic_taken_at'] = this.statisticTakenAt;
    return data;
  }
}
