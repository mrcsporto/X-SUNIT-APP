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

##### Type on input field to see [API Documentation](https://x-sunit-api.herokuapp.com/documentation)
```sh
- https://x-sunit-api.herokuapp.com/api/v1/documentation
```

### Features
```sh
- Sortable Tables by Column (ASC and DESC)
- Pagination per page (25 items)
- Graphic Charts with Reports
- Fully responsive
- Download CSV file
- JSON rendering on each path (Ex.: GET /survivors.json)
```
