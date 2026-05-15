#!/bin/sh
set -e

# Replace backend URL in JavaScript files if environment variable is set
if [ -n "$VITE_API_URL" ]; then
    echo "Replacing API URL with: $VITE_API_URL"
    find /usr/share/nginx/html -type f -name "*.js" -exec sed -i "s|VITE_API_URL_PLACEHOLDER|$VITE_API_URL|g" {} \;
fi

# Execute the main command
exec "$@"