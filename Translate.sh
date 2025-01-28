#!/bin/bash
#set -x
word=$(rofi -dmenu -p "Enter the word to translate: ")
url="https://translate.google.com.eg/?sl=en&tl=ar&text=$word&op=translate"
firefox $url
