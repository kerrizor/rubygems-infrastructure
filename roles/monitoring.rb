name 'monitoring'
description 'Monitoring servers'
run_list(
  'recipe[rubygems-sensu::server]'
)
