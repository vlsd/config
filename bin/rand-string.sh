#!/bin/bash

function randpass
{
echo `</dev/urandom tr -dc A-Za-z0-9 | head -c8`
}
randpass

