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

##### Type on input field to check [API Documentation]([https://x-sunit-api.herokuapp.com/documentation](https://bold-eclipse-904583.postman.co/workspace/My-Workspace~d43e2678-6c46-4988-8d30-10758342ecc3/collection/23374730-acd38a3d-df69-4e76-a593-ff2875935482?action=share&creator=23374730))
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
