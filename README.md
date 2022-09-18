# X-SUNIT APP

API Documentation
(http://localhost:3000/documentation)

### Setup Versions

* Ruby version: 3.0.4
* Rails version: 6.1.7

##### Install gems
```sh
$ bundle install
```
##### Database migration
```sh
$ rails db:migrate 
```
##### Populate databse
```sh
$ rails utils:setup_survivors QTD=n  # Populate database with survivors (specify quantity w/ QTD=n)
$ rails utils:setup_reports QTD=n  # Populate database with abductions reports (specify quantity w/ QTD=n)
```
### Features

- Sortable Tables
- Pagination
- Graphic Charts
- Fully responsive
