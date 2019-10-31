#! /bin/bash

FORTUNE_DIR="fortune-forge/usr/share/games/fortunes"
QUOTES_DIR="quotes"

mv build fortune-forge
mkdir -p "${FORTUNE_DIR}"

for file in $(ls quotes); do
    cp "${QUOTES_DIR}/${file}" "${FORTUNE_DIR}"
    strfile "${FORTUNE_DIR}/${file}"
done

dpkg -b fortune-forge
