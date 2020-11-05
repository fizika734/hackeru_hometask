#!/bin/bash
grep -oP '\d*\.\d*\.\d*\.\d*' access.log |sort | uniq -c | sort -nr