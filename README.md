# X-SUNIT APP

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

##### Type on input field to check [API Documentation](https://documenter.getpostman.com/view/23374730/2s8YY9v6YQ)
```sh
https://x-sunit-api.herokuapp.com/api/v1/documentation
```

### Features
```sh
- Sortable Tables by Column (ASC and DESC)
- Pagination
- Graphic Charts
- Fully responsive
- CSV file download
- JSON/HTML rendering
```
