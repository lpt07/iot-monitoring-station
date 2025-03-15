#!/bin/bash

# Add execute permission on all shell scripts
find . -type f -name "*.sh" -exec chmod +x {} + 2> /dev/null

# Replace \r\n with \n for all shell scripts
find . -type f -name "*.sh" -exec dos2unix {} + 2> /dev/null