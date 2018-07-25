INSTALL_PATH :=  /opt/optune/servo/
BUILD_DIR = build
VERSION = 1.0

.PHONY: tar clean

tar: clean
	mkdir -p $(BUILD_DIR)/$(INSTALL_PATH) $(BUILD_DIR)/etc/systemd/system/

	# Servo and helpers
	curl -s -o $(BUILD_DIR)/$(INSTALL_PATH)/adjust.py https://raw.githubusercontent.com/opsani/servo/master/adjust.py
	curl -s -o $(BUILD_DIR)/$(INSTALL_PATH)/measure.py https://raw.githubusercontent.com/opsani/servo/master/measure.py
	curl -s -o $(BUILD_DIR)/$(INSTALL_PATH)/servo https://raw.githubusercontent.com/opsani/servo/master/servo

	# Adjust driver
	curl -s -o $(BUILD_DIR)/$(INSTALL_PATH)/adjust https://raw.githubusercontent.com/opsani/servo-javaservice/master/adjust

	# Measure driver
	curl -s -o $(BUILD_DIR)/$(INSTALL_PATH)/measure https://raw.githubusercontent.com/opsani/servo-datadog/master/measure

	# Sample cfg and token
	cp -a servo.cfg-sample optune-auth-token-sample $(BUILD_DIR)/$(INSTALL_PATH)

	# Service script to start/stop the servo
	cp -a optune-servo.service  $(BUILD_DIR)/etc/systemd/system/

	# Make drivers executable
	chmod +x $(BUILD_DIR)/$(INSTALL_PATH)/adjust  $(BUILD_DIR)/$(INSTALL_PATH)/measure

	# Create tar
	tar -czvf optune-servo-$(VERSION).tar.gz -C $(BUILD_DIR) ./


clean:
	rm -rf $(BUILD_DIR)


# TODO: tager for building a Docker image
