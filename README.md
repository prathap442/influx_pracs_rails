# In the File

>> Aim: Testing with the Influx Db and rails was my main aim of the standard


```
  Create the Project
  echo "gem 'influxdb-rails'" > Gemfile
  bundle install
  bundle exec rails generate influxdb
```
# Change the configuration influxdb.yaml that is created
```
InfluxDB::Rails.configure do |config|
  ## The only setting you actually need to update is the name of the
  ## database within the InfluxDB server instance. Don't forget to
  ## create this database as well.
  config.client.database = "rails"
  config.client.hosts = ["172.17.0.2"]
  config.client.port = 8086

  ## If you've setup user authentication (and activated it in the server
  ## config), you need to configure the credentials here.
  # config.client.username = "root"
  # config.client.password = "root"

  ## Various other client and connection options. These are used to create
  ## an `InfluxDB::Client` instance (i.e. `InfluxDB::Rails.client`).
  ##
  ## See docs for the influxdb gem for the canonical list of options:
  ## https://github.com/influxdata/influxdb-ruby#list-of-configuration-options
  ##
  ## These defaults for the influxdb-rails gem deviate from the default
  ## for the influxdb gem:
  # config.client.async = true # false
  # config.client.read_timeout = 30 # 300
  # config.client.max_delay = 300 # 30
  # config.client.time_precision = "ms" # "s"

  ## Prior to 1.0.0, this gem has written all data points in different
  ## measurements (the config options were named `series_name_for_*`).
  ## Since 1.0.0.beta3, we're now using a single measurements
  # config.measurement_name = "rails"

  ## Disable rails framework hooks.
  # config.ignored_hooks = ['sql.active_record', 'render_template.action_view']

  # Modify tags on the fly.
  # config.tags_middleware = ->(tags) { tags }

  ## Set the application name to something meaningful, by default we
  ## infer the app name from the Rails.application class name.
  # config.application_name = Rails.application.class.parent_name
end

```

I have run the ocker container for the sake of the influxdb that has ade my lifececome easier so later exectue the command for the sake of the influxdb


```
$ docker pull influxdb:latest
```

```
$ docker run -d influxdb:latest

```


* so the ip adderess of the influxdb container is being taken adn then setted up in fthe configuratin file as shown for the influxdb_rails.rb .

# Now i have verified weather the influxdb respond to me back with some data


```
 prathap@prathap-HP-EliteBook-840-G1  ~/Documents/rails_pracs/influx_pracs   master ●  curl -G http://172.17.0.2:8086/query --data-urlencode "q=SHOW DATABASES;"   

{"results":[{"statement_id":0,"series":[{"name":"databases","columns":["name"],"values":[["_internal"],["rails"]]}]}]}
```


