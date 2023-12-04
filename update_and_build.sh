#!/bin/bash

# Update the submodule
git submodule update --remote

# Move to the submodule directory
cd app/javascript/module/editor

# Install dependencies
yarn install

# Execute vite build
yarn build

# Copy the built files to the specified location
cp -r dist/* ../../packs/dist/

# Return to the original directory
cd -
