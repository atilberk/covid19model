![](https://github.com/ImperialCollegeLondon/covid19model/workflows/CI/badge.svg)

# covid19model
Code for modelling estimated deaths and cases for COVID19 from Report 13 published by MRC Centre for Global Infectious Disease Analysis, Imperial College London: [Estimating the number of infections and the impact of nonpharmaceutical interventions on COVID-19 in 11 European countries](https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-13-europe-npi-impact/) 

This repository has code for replication purposes. The bleeding edge code and advancements are done in a private repository. Ask report authors for any collaborations. 

# Installing dependencies

## Using Conda

An `environment.yml` file is provided and can be used to build a virtual
environment containing all model dependencies. Create the environment using:
```
conda env create -f environment.yml
```

Then activate the environment for use:
```
conda activate covid19model
```

## Using Docker

A [Docker][] image providing all model dependencies is available. See
[docker/README.md](docker/) for details of running the model with Docker.

[Docker]: https://www.docker.com/

## Other

If you wish to install packages into your native R environment or with a system
package manager please see `environment.yml` for a full list of dependencies.

# How to run the code

There are two ways to run our code:-
* Open the rstudio project covid19model.Rproj file in rstudio and run/source base.r file
* To run from commandline please enter the cloned directory and type 'Rscript base.r base' in terminal
* The results are stored in two folders results and figures.
* Results has the stored stan fits and data used for plotting
* Figures have the images with daily cases, daily death and Rt for all countries.

## Please note to not make you wait for long we have by default run sampling for short period. To be comparable with report please uncomment the line 206 and comment out line 207. This will run sampling for 4000 iterations with 2000 warmups and 4 chains.


## Notes on Turkey

- The COVID-19-up-to-date data has been updated (up to 5th of April). Data of Turkey has been corrected (some earlier numbers from ECDC does not match with [nationally announced numbers](https://covid19.saglik.gov.tr/)) and originated from 31/12/2020. (please fix origin after running fetch-ecdc.R)
- The weighted IFR is calculated for Turkey as 0.006147 (based on the rates on [earlier work](https://www.imperial.ac.uk/media/imperial-college/medicine/mrc-gida/2020-03-16-COVID19-Report-9.pdf))
- The dates of interventions are taken as table below:

|Intervention Type|Description|Date|
|------------|-----------|----|
|schools_universities|Nationwide school closures [*](https://www.trthaber.com/haber/gundem/16-mart-itibariyla-okullar-bir-hafta-tatil-edilecek-466679.html)|14/03/2020|
|travel_restrictions|Banning all international flights, intercity travels requires government permission [*](https://www.trthaber.com/haber/gundem/cumhurbaskani-erdogan-yeni-tedbirleri-acikladi-470824.html)|28/03/2020|
|public_events|All theatres, cinemas, restaurants, cafes are closed [*](https://www.trthaber.com/haber/gundem/icisleri-bakanligindan-81-ile-ek-genelge-koronavirus-tedbirleri-genisliyor-467561.html)|17/03/2020|  
|sport|All national league sport games are postponed [*](https://www.trthaber.com/haber/spor/sporda-koronavirus-toplantisi-468423.html)|19/03/2020|
|lockdown|Borders of cities are closed, 3-step distances, curfew for under-20 and over-65 [*](https://www.trthaber.com/haber/gundem/cumhurbaskani-erdogan-30-buyuksehir-arac-giris-cikisina-kapatilacak-472859.html)|03/04/2020|  
|social_distancing_encouraged|Minister of Health announced first death while advising to avoid crowded places [*](https://www.trthaber.com/haber/gundem/turkiyede-koronavirus-kaynakli-ilk-olum-467942.html)|17/03/2020|
|self_isolating_if_ill|Official Coronavirus Hotline is opened advising for ill [*](https://www.trthaber.com/haber/turkiye/korona-danisma-hatti-hizmet-vermeye-basladi-467012.html)|14/03/2020|