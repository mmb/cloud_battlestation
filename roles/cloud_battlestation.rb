name 'cloud_battlestation'
description 'Cloud Battlestation'

override_attributes(
    'ddclient' => {
        'login' => '',
        'password' => '',
        'domain' => ''
    }
)

run_list %w(
  recipe[ddclient]
  recipe[cloud_battlestation]
)
