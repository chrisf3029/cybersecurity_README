#!/bin/bash
lynis audit system --auditor Chris --no-color >> /tmp/lynis.system_scan.log 2>&1
