## Build
```
make tar
```

## Install
```
tar -xvf optune-servo-1.0.tar.gz -C /
```

## Configure
Update the following in `/opt/optune/servo`:
 * Set your authentication token in `optune-auth-token`, see `optune-auth-token-sample`
 * Set your account id and app id in `servo.cfg`, see `servo.cfg-sample`

./app-desc.yaml for


## Run
```
systemctl daemon-reload
systemctl enable optune-servo
systemctl start optune-servo
```

## View logs
```
journalctl -f -u optune-servo.service
```

## Dependencies
pip3 install datadog requests PyYAML



