# PgBadger Cookbook

Installs/configures [PgBadger](http://dalibo.github.io/pgbadger/)

<img src="https://cdn.evilmartians.com/badges/logo-no-label.svg" alt="Evil Martians logo" width="22" height="16" /> <b>chef-pgbadger</b> is built by <b><a href="https://evilmartians.com/">Evil Martians</a></b>, an American design and engineering consultancy for <b>developer tools, AI, and cybersecurity startups</b>.

## Requirements

### packages

* `perl` - pgbadger needs only perl to run

### cookbooks

* `apt`
* `cron`

## Attributes

### pgbadger::default

|Key|Type|Description|Default|
|---|----|-----------|-------|
|`['pgbadger']['databases']`|`Array`|List of databases to perform.|`[]`|
|`['pgbadger']['data_dir']`|`String`|Path for generated reports| `/var/www/pgbadger`|
|`['pgbadger']['log_path']`  |`String`|Path to PostgreSQL log|`/var/log/postgresql/postgresql-#{node['postgresql']['defaults']['server']['version']}-main.log`|
|`['pgbadger']['rhytm']`|`String`|Periodicity of reports generation. E.g. `hourly`, `daily`, `monthly`, etc. |`hourly`|
|`['pgbadger']['user']`|`String`|Reports owner|`root`|


## Usage

### pgbadger::install

Just include `pgbadger::install` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[pgbadger::install]"
  ]
}
```


### pgbadger::default

Include `pgbadger` in your node's `run_list` and add list of databases to node attributes:

```json
{
  "name": "my_node",
  "pgbadger": {
    "databases": [
      "lucifer",
      "antropolog"
    ]
  },
  "run_list": [
    "recipe[pgbadger]"
  ]
}
```

### pgbadger::web

Include `pgbadger::web` in your node's `run_list` and create data bag `pgbadger_users` with items like following:

```json
{
  "id": "report_viewer",
  "password": "superduperpassword"
}
```

It will create file `.passwd` in `node['pgbadge']['data_dir']` directory with user:password pairs, compatible with [NGINX](http://nginx.org/) and [Apache](http://httpd.apache.org/)

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## Special thanks
   Sponsored by [Evil Martians](http://evilmartians.com)

## Authors
   - Maxim Filatov <bregor@evilmartians.com>
   - Kirill Kouznetsov <agon.smith@gmail.com>
