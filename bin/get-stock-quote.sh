#!/bin/sh

ticker=$1
wget -qO- "http://download.finance.yahoo.com/d/quotes.csv?s=${ticker}&f=l1"
